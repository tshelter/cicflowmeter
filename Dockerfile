FROM ghcr.io/astral-sh/uv:python3.10-bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tcpdump \
        libpcap0.8 \
        zlib1g \
        gcc \
        bash && \
    rm -rf /var/lib/apt/lists/*

ENV UV_PYTHON_DOWNLOADS=never \
    UV_PYTHON=python3.10

WORKDIR /app

COPY . .

RUN uv sync --locked --no-dev

ENTRYPOINT [ "/app/.venv/bin/cicflowmeter" ]

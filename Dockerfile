FROM ghcr.io/tbaile/hugo:0.121.2-debian-extended as base
WORKDIR /app

FROM base as dev
RUN apt-get update \
    && apt-get install -y \
        git \
    && rm -rf /var/lib/apt/lists/*
ARG UID
ARG GID
RUN groupadd -g $GID hugo && \
    useradd -u $UID -g $GID -m hugo
USER hugo

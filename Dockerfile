# Custom Spilo image with vectorchord extension

ARG SPILO_VERSION=4.0-p2
ARG POSTGRES_VERSION=17

FROM ghcr.io/zalando/spilo-${POSTGRES_VERSION}:${SPILO_VERSION}

ARG POSTGRES_VERSION=17
ARG VCHORD_VERSION=0.5.3
ARG TARGETARCH

RUN env && curl -L \
      "https://github.com/tensorchord/VectorChord/releases/download/${VCHORD_VERSION}/postgresql-${POSTGRES_VERSION}-vchord_${VCHORD_VERSION}-1_${TARGETARCH}.deb" \
      -o vchord.deb \
    && ls -la \
    && apt-get install -y ./vchord.deb \
    && rm -f vchord.deb \
    && rm -rf /var/lib/apt/lists/*

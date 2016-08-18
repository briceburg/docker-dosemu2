FROM debian:jessie

RUN sed -i "s/ jessie main$/ jessie main contrib/" /etc/apt/sources.list && \
  apt-get update && apt-get install -y --no-install-recommends \
    dosemu \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["dosemu"]

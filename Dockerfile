FROM debian:stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
    gpm \
    libsdl2-2.0-0 \
    libslang2 \
    man \
  && rm -rf /var/lib/apt/lists/*

COPY dosemu2_amd64.deb /tmp/dosemu2.deb
RUN dpkg -i /tmp/dosemu2.deb && rm -rf /tmp/dosemu2.deb

ENTRYPOINT ["dosemu"]

FROM debian:stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
    gpm \
    libsdl2-2.0-0 \
    libslang2 \
    locales \
    man \
  && rm -rf /var/lib/apt/lists/*

ENV \
  LANG="C.UTF-8" \
  LC_ALL="C.UTF-8"

RUN \
  locale-gen C.UTF-8 en_US.UTF-8 en_us && \
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
  update-locale LANG=C.UTF-8

COPY dosemu2_amd64.deb /tmp/dosemu2.deb
RUN dpkg -i /tmp/dosemu2.deb && rm -rf /tmp/dosemu2.deb

ENTRYPOINT ["dosemu"]

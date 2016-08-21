FROM debian:stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
    gpm \
    libsdl2-2.0-0 \
    libslang2 \
  && rm -rf /var/lib/apt/lists/*

COPY dosemu2_amd64.deb /tmp/dosemu2.deb
RUN dpkg -i /tmp/dosemu2.deb && rm -rf /tmp/dosemu2.deb && \
 chmod +s $(which dosemu)

ENTRYPOINT ["dosemu"]

# dex ( https://github.com/dockerland/dex )
#  * prefer common home in derivatives.
#  * default to interactive tty, sharing tty0 to allow console layout detection.
LABEL org.dockerland.dex.docker_home="dosemu"
LABEL org.dockerland.dex.docker_flags="-it --device=/dev/tty0"

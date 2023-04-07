FROM quay.io/toolbx-images/ubuntu-toolbox:20.04

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="<brian@27megahertz.com>"


COPY gnuradio-setup /tmp/gnuradio-setup
RUN chmod +x /tmp/gnuradio-setup && /tmp/gnuradio-setup

RUN rm -rf /tmp/*

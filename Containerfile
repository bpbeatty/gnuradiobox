FROM quay.io/toolbx-images/ubuntu-toolbox:20.04

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="<brian@27megahertz.com>"


COPY gnuradio-setup /tmp/gnuradio-setup
RUN chmod +x /tmp/gnuradio-setup && /tmp/gnuradio-setup

RUN rm -rf /tmp/*

ENV LD_LIBRARY_PATH=/user/local/lib:$LD_LIBRARY_PATH
ENV PYTHONPATH=/usr/local/lib/python3/dist-packages:usr/local/lib/python3/site-packages:$PYTHONPATH

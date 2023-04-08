ARG UBUNTU_MAJOR_VERSION=22.04
ARG BASE_CONTAINER_URL=quay.io/toolbx-images/ubuntu-toolbox
ARG VERSION

FROM ${BASE_CONTAINER_URL}:${UBUNTU_MAJOR_VERSION}

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="<brian@27megahertz.com>"

COPY ${VERSION} /tmp/version.yml

COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

COPY gnuradio-setup /tmp/gnuradio-setup
RUN chmod +x /tmp/gnuradio-setup && /tmp/gnuradio-setup

RUN rm -rf /tmp/*

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
ENV PYTHONPATH=/usr/local/lib/python3/dist-packages:usr/local/lib/python3/site-packages:$PYTHONPATH

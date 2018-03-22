FROM ubuntu:14.04

LABEL name "webos-builder"

RUN useradd -ms /bin/bash builder

COPY --chown=builder:builder webos /home/builder/webos
COPY --chown=builder:builder build.sh /home/builder/
WORKDIR /home/builder/webos

RUN apt-get update && apt-get upgrade -y && ./scripts/prerequisites.sh

USER builder

RUN ./mcf raspberrypi3
ENTRYPOINT ["../build.sh"]
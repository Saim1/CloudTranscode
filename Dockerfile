FROM sportarc/cloudtranscode-base:3.2.2
MAINTAINER Sport Archive, Inc.

COPY . /usr/src/cloudtranscode
WORKDIR /usr/src/cloudtranscode

RUN DEBIAN_FRONTEND=noninteractive TERM=screen \
    apt-get update \
    && apt-get install -y git \
    && make \
    && apt-get purge -y git \
    && apt-get autoremove -y

ENTRYPOINT ["/usr/src/cloudtranscode/bootstrap.sh"]

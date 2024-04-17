FROM debian:buster-slim as build

ENV DEPENDENCIES gcc make libssl-dev libpcre3-dev zlib1g-dev
ENV BASEDIR /tmp/shadowsocksr-libev

RUN apt-get update && apt-get install -y $DEPENDENCIES

COPY . $BASEDIR

WORKDIR $BASEDIR 

RUN ./configure --disable-documentation && make && make install

FROM debian:buster-slim

RUN apt-get update && apt-get install -y libssl-dev

WORKDIR  /usr/local/bin/ 

COPY --from=build /usr/local/bin/ss-local ./ss-local

CMD ["ss-local", "-h"]

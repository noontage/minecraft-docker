#
# minecraft by alpine
#
FROM openjdk:8-alpine
LABEL maintainer "@noontage"

WORKDIR /mcroot
EXPOSE 25565

RUN apk update && \
    apk add \
#      ca-certificates \
#      openjdk8-jre-base \
      screen \
#      wget \
#    && addgroup -g 1000 minecraft \
#    && adduser -Ss /bin/false -u 1000 -G minecraft -h /mcroot minecraft \
    && mkdir -p /mcroot/app \
#    && mkdir -p /mcroot/conf \
#    && wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar -O /mcroot/app/minecraft_server.jar \
#    && chown -R minecraft:minecraft /mcroot \
#    && apk del \
#      wget \
#      ca-certificates \
    && rm -rf /var/cache/apk/*

VOLUME ["/mcroot/app"]
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
FROM schebrolu/docker-openjdk

MAINTAINER Srini Chebrolu <schebrolu@apigee.com>

RUN apk -U add bash curl

ENV RIENMANN_VERSION=0.2.10
ENV RIEMANN_PATH=/opt/riemann
ENV RIEMANN_CONFIG=$RIEMANN_PATH/riemann.config

WORKDIR $RIEMANN_PATH

RUN curl -s https://aphyr.com/riemann/riemann-$RIENMANN_VERSION.tar.bz2 | \ 
    tar -xjC $RIEMANN_PATH

RUN sed -i -e "s|127.0.0.1|0.0.0.0|" $RIEMANN_PATH/riemann-$RIENMANN_VERSION/etc/riemann.config

EXPOSE 5555 5555/udp 5556

RUN adduser -D riemann
USER riemann

#ToDo: Need to make sure riemann service up
#ENTRYPOINT '$RIEMANN_PATH/riemann-$RIENMANN_VERSION/bin/riemann'
#CMD '$RIEMANN_PATH/riemann-$RIENMANN_VERSION/etc/riemann.config'


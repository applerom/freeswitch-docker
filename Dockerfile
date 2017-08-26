FROM debian:8
RUN apt-get update \
        && apt-get install -y wget \
                sudo \
        && MYSITE=fs-docker.secrom.com bash -c "$(wget -q -O- https://raw.githubusercontent.com/applerom/linuxcmd/master/start.sh)" \
        && echo "deb http://files.freeswitch.org/repo/deb/freeswitch-1.6/ jessie main" > /etc/apt/sources.list.d/freeswitch.list \
        && wget -O - https://files.freeswitch.org/repo/deb/debian/freeswitch_archive_g0.pub | apt-key add - \
        && apt-get update \
        && apt-get install -y --force-yes freeswitch-video-deps-most \
                          postgresql-client unixodbc-dev odbc-postgresql

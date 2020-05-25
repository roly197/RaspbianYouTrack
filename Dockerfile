FROM raspbian/stretch

MAINTAINER rolyvanleersum@ziggo.nl

RUN mkdir -p /opt/youtrack/data /opt/youtrack/backup /opt/youtrack/bin

WORKDIR /opt/youtrack

ENV YOUTRACK_VERSION 2020.1.5557

RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get install -y openjdk-8-jdk &&\
    rm -rf /var/lib/apt/lists/*

ADD supervisor/youtrack.conf /etc/supervisor/conf.d/youtrack.conf

RUN wget --no-verbose \
 https://download.jetbrains.com/charisma/youtrack-${YOUTRACK_VERSION}.jar \
 -O /opt/youtrack/bin/youtrack.jar

EXPOSE 80/tcp

VOLUME ["/opt/youtrack/data/", "/opt/youtrack/backup/"]

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

FROM docker/java-oracle7
MAINTAINER David Medinets <david.medinets@gmail.com>

RUN apt-get install -y unzip

ADD spring-xd-1.0.0.M7-dist.zip /
RUN unzip /spring-xd-1.0.0.M7-dist.zip
RUN rm /spring-xd-1.0.0.M7-dist.zip

ENV XD_HOME /spring-xd-1.0.0.M7/xd
ENV JAVA_OPTS "-Dzk.embedded.server.port=5555"

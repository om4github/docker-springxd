FROM medined/docker-java-oracle7
MAINTAINER David Medinets <david.medinets@gmail.com>

RUN apt-get install -y unzip

RUN wget http://repo.spring.io/libs-milestone/org/springframework/xd/spring-xd/1.1.0.RC1/spring-xd-1.1.0.RC1-dist.zip
RUN unzip /spring-xd-1.1.0.RC1-dist.zip
RUN rm /spring-xd-1.1.0.RC1-dist.zip

ENV XD_HOME /spring-xd-1.1.0.RC1-dist/xd
ENV JAVA_OPTS "-Dzk.embedded.server.port=5555"

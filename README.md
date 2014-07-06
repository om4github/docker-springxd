# Spring XD on Docker

01_run_springxd_singlenode.sh - This script runs a Spring XD Single Node server inside Docker. The server is reachable via port 9393. The internal Zookeeper node is reachable via port 5555.

02_run_springxd_shell.sh - This script runs the Spring XD shell inside Docker. Follow on-script prompt to connect with Spring XD Single Node server.

03_run_bash_shell.sh - This script runs a plain bash shell using the Spring XD image for exploration and development.

## Preparation 

```
cd springxd
wget http://repo.spring.io/simple/libs-milestone-local/org/springframework/xd/spring-xd/1.0.0.M7/spring-xd-1.0.0.M7-dist.zip
```

## Build Images

```
./build_images.sh
```

This script builds two images. An images for the Zookeeper web application (springxd-zookeeper-ui). And an image for the springxd project.

## Management URLs

```
/management/beans
/management/metrics/{name:.*}]
/management/metrics
/management/env/{name:.*}
/management/env
/management/info
/management/jolokia/**
/management/mappings
/management/dump
/management/health
/management/trace
/management/autoconfig
/management/configprops
```

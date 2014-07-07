# Spring XD on Docker

Learn about Spring XD at http://projects.spring.io/spring-xd/. This image is 
simple in that is just lets you run the Spring XD Single Node server as a 
Docker image.

The embedded Zookeeper server is hard-coded to be 5555. You don't need to 
expose this port on the host but doing so may be handy if you want to 
understand which Zookeeper nodes are used by Spring XD.

## Build Images

You can use the image directly from the register via 

````
docker pull medined/docker-springxd
```

or you can use the script 

```
./build_image.sh
```

The script does nothing complex. It just wraps Docker's build command.

## Running the Spring XD Single Node server

The run_springxd_singlenode.sh script makes it simple to start the Single Node.
It automatically exposes ports 5555 and 9393 to the host machine. Additionally,
the URLs for REST service and the embedded Zookeeper are printed. You can start
the Single Node server manually using

```
docker run --name=springxd-singlenode \
  -p 5555:5555 \
  -p 9393:9393 \
  -d \
  -t medined/docker-springxd:1.0.0.M7 \
  /spring-xd-1.0.0.M7/xd/bin/xd-singlenode
```

## Running the Spring XD Shell

The Spring XD shell depends on the Spring XD server in order to perform
work. It does not need to be run on the same machine as the Spring XD 
server. When started, it assumes the Spring XD server can be found on
localhost. The 'admin config server' command tells the Spring XD shell
where to find the Spring XD server. If you use the provided script 
it provides some hand-holding. The provided script is at 

```
./run_springxd_shell.sh
```

Of course, you can run the image yourself using a command like this:

```
docker run --name=springxd-shell \
  -i \
  -t medined/springxd:1.0.0.M7 \
  /spring-xd-1.0.0.M7/shell/bin/xd-shell
``` 

## Runng a BASH Shell

If you want to experiment with the image you can simply start a BASH shell 
instead of a Spring XD program. The provided script is called

```
./run_bash_shell.sh
```

The script wraps the following

```
docker run --name=springxd-bash \
  -i \
  -t medined/springxd:1.0.0.M7 \
  /bin/bash
```

## Management URLs

The Spring XD server provides several management REST endpoints used
to monitor the running processes. The following list is just a 
reminder what's available.

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

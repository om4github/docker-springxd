# Spring XD on Docker

## Preparation 

```
wget http://repo.spring.io/simple/libs-milestone-local/org/springframework/xd/spring-xd/1.0.0.M7/spring-xd-1.0.0.M7-dist.zip
```

## Build Images

```
./build_image.sh
```

## Run Spring XD Single Node Image

```
./01_run_springxd_singlenode.sh
```

## Run Spring XD Shell

```
./02_run_springxd_shell.sh
```

After running this script, you'll see the following prompt. This is fine. Follow
the directions on the script to configure the shell to connect to the Single Node
docker image.

```
server-unknown:>
```

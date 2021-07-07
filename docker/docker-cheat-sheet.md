# Docker Cheat sheet
## A Cheat sheet for docker commands and docker related topics

### Commands - Basic

```bash
docker run <containerId or imageName>
```
creates a new docker container based on an image
If an image is not found locally, it will be pulled from docker hub before being started  
-e Can be used to set environment variables  
-d Runs in detached mode, runs in background. Given Id of container.  
-p specify a port to bind a container to. Ex -p 6000:6379 will bind local port 6000 to container port 6379  
--name specify a name for container  
--net let's you specify a docker network  

```bash
docker start
```
Restarts a stopped container

```bash
docker stop <containerId>
```
Stops a docker container

```bash
docker ps
```
Lists running docker containers and their info  
-a shows all containers including stopped ones

```bash
docker pull
```
Pulls down a docker image from docker hub to local

```bash
docker images
```
Lists pulled down images

```bash
docker logs <containerID>
```
Shows logs for a container

```bash
docker exec <container> <command>
```
-it Gets an interactive terminal  
Executes a command on a container  
To get a bash shell on a container:
```bash
docker exec -t <container> bash
```

### Commands - Intermediate

```bash
docker network ls
```
Lists docker networks

```bash
docker network create
```
Creates a docker network

```bash
docker rm
```
removes a docker container

```bash
docker build -t <tag> <dockerfile location>
```
Builds a docker container based on a docker file

```bash
docker rmi <image>
```
Deletes a docker image

### Commands - Advanced
```bash
docker run --entrypoint "/bin/sh" -it <image name>
```
Runs a container in intereactive mode with a shell

### Commands - docker compose
```bash
docker compose -f <docker-compose-file> up
```
Uses a docker compose file to create and start multiple containers

```bash
docker compose -f <docker-compose-file> down
```
Uses a docker compose file to stop multiple containers and their network

### Concepts
#### Tags
Tags are used to specify specific versions of images

#### Ports
A container has their own ports. A binding must be created between a host port and a container. This way containers can listen on the same port, but have a different host port.

#### Docker Network
When a container is deployed, it is deployed in isolated docker network. Containers can communicate via names. Applications outside use ports

#### Docker Compose
Creating structured docker commands in a YAML file. Will create a common network for containers. Does not need to be specified

#### Docker File
Blueprint for building images. Must be named Dockerfile
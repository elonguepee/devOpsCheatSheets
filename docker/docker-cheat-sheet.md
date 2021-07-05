# Docker Cheat sheet
## A Cheat sheet for docker commands and docker related topics

### Commands - Basic

#### docker run <containerId or imageName>
creates a new docker container based on an image
If an image is not found locally, it will be pulled from docker hub before being started
-e Can be used to set environment variables
-d Runs in detached mode, runs in background. Given Id of container.
-p specify a port to bind a container to. Ex -p 6000:6379 will bind local port 6000 to container port 6379
--name specify a name for container
--net let's you specify a docker network

#### docker start
Restarts a stopped container

#### docker stop <containerId>
Stops a docker container

#### docker ps
Lists running docker containers and their info
-a shows all containers including stopped ones

#### docker pull
Pulls down a docker image from docker hub to local

#### docker images
Lists pulled down images

#### docker logs <containerID>
Shows logs for a container

#### docker exec
-it Gets an interactive terminal
Gets a terminal for a container

### Commands - Advanced

#### docker network ls
Lists docker networks

#### docker network create
Creates a docker network

#### docker rm
removes a docker container

### Concepts
#### Tags
Tags are used to specify specific versions of images

#### Ports
A container has their own ports. A binding must be created between a host port and a container. This way containers can listen on the same port, but have a different host port.

#### Docker Network
When a container is deployed, it is deployed in isolated docker network. Containers can communicate via names. Applications outside use ports

#### Docker Compose
Creating structured docker commands in a YAML file. Will create a common network for containers. Does not need to be specified

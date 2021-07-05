# Docker Cheat sheet
## A Cheat sheet for docker commands and docker related topics

### Commands

*docker run*
Starts a docker container
If an image is not found locally, it will be pulled from docker hub before being started
-e Can be used to set environment variables
-d Runs in detached mode, runs in background. Given Id of container.

*docker stop*
Stops a docker container

*docker ps*
Lists running docker containers and their info
-a shows all containers including stopped ones

*docker pull*
Pulls down a docker image from docker hub to local

*docker images*
Lists pulled down images

### Concepts
*Tags*
Tags are used to specify specific versions of images

*Ports*
A container has their own ports. A binding must be created between a host port and a container. This way containers can listen on the same port, but have a different host port.

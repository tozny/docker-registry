# Docker Registry

This project was started since it was somewhat painful to add authentication to the Docker Distribution container in an automated fashion. The changes to the image are relatively straightforward. Essentially, rather than creating a htpasswd file and then copying it back into a container, the username and password are passed in during runtime to the container, which then generates the htpassword and starts the registry server. 

## Quickstart

`docker run -d -p 5000:5000 -e REGISTRY_PASSWORD=docker -e REGISTRY_USER=docker bentozny/docker-registry`

## Running with Docker Compose

### Build the container image

`docker-compose build`

### Start the container

`docker-compose up`

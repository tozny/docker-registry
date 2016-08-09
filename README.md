# Docker Registry

This project was started since it was somewhat painful to add authentication to the Docker Distribution container in an automated fashion. The changes to the image are relatively straightforward. Essentially, rather than creating a htpasswd file and then copying it back into a container, the username and password are passed in during runtime to the container, which then generates the htpassword and starts the registry server. 

## Quickstart

`docker run -d -p 5000:5000 bentozny/docker-registry user password`

## Running with Docker Compose


### Build the container image

`docker-compose build`

### Start the container

`docker-compose up`

## Run the container without docker-compose

### Build

`docker build -t test-registry .`

### Run

```
docker run -d -p 5000:5000 --restart=always \
-e "REGISTRY_AUTH=htpasswd" \
-e "REGISTRY_AUTH_HTPASSWD_REALM=realm" \
-e "REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd" \
test-registry <user> <password>
```


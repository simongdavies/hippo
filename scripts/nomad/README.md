# Nomad Demo

Hippo with Nomad scheduler can be run using a container - instructions.

## Setup

### Get or build the Container Image

```shell
docker pull ghcr.io/simongdavies/hippo-nomad:latest
```

If you want to build your own version of the contaier then you can clone this repo and run the command ` ./scripts/build-nomad-image.sh`. This requires the dotnet SDK on your machine to build Hippo.

## Demo

### Run the container

```
docker run --name hippo-nomad --rm -d -p 8080:8080 -p 5001:5001 -p 8088:8088 -p 8500:8500 -p 4646:4646 -p 8200:8200 -p 8081:8081 ghcr.io/simongdavies/hippo-nomad:latest
```

Bindle and Hippo state can be persisted on the host by mounting the volume /data to the host, otherwise state will be lost when the container is removed.

### Run the Hippo quickstart demo

The container has all the client tools needed to build and push an application to Hippo (using rust), you can also use client tools on the host, to do this in additon to setting the environment variables in the host also set the environent variable BINDLE_PASSWORD when starting the container, if this variable is not set a new password will be generated each time the container is started.

to run the quickstart demo from the container run `docker exec -it hippo-nomad /bin/bash`. There is no need to set any environment variables other than HIPPO_USERNAME and HIPPO_PASSWORD.


Make sure to use the domain suffix `hippofactory.io` when generating an app with yo wasm.

Once the app has been published you should be able to navigate to it from the environment page in hippo , the URL should be http://<channel>.<app>.hippofactory.io/8088.


- Hippo - https://localhost:5001/
- Traefik - http://localhost:8081/dashboard/#/
- Nomad -  http://localhost:4646/ui
- Consul - http://localhost:8500/ui/
- Vault - http://localhost:8200


## Dockerized B2SAFE instance

Pre-requisites:

```bash
# install docker and docker-compose

 $ docker --version
Docker version 17.06.1-ce-rc1, build 77b4dce
 $ docker-compose --version
docker-compose version 1.14.0, build c7bdf9e
```

Clone this repo:
```
$ git clone https://github.com/pdonorio/dockerizing.git 
$ cd dockerizing/composer/b2stage
```

---

NOTE: Edit the `docker-compose.yml` file before the first startup.

Bring the servers up (it might take longer the first time):

```bash
$ docker-compose up -d
```

See logs:

```bash
$ docker-compose logs
```

Operations:

```bash
$ docker-compose stop
$ docker-compose start
$ docker-compose restart
$ docker-compose down
$ docker-compose down --volumes  # NOTE: remove all persistent data
```

You still could:

- add more B2SAFE integration, see [this example Dockerfile](https://github.com/EUDAT-B2STAGE/docker-images/blob/master/images/b2safe/Dockerfile#L5).
- understand more from EUDAT training and federate another container, see [this documentation](https://github.com/EUDAT-Training/B2SAFE-B2STAGE-Training)
- check the official documentation to federate iRODS, follow [this link](https://docs.irods.org/4.2.1/system_overview/federation/)


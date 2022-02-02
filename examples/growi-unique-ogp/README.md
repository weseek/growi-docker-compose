growi-docker-compose with growi-unique-ogp Integration Example
=====================================================

This example enables GROWI to integrate with growi-unique-ogp
so that user will be able to generate ogp.

Install and Start
------------------

### Clone repos and copy docker-compose.override.yml

```bash
git clone https://github.com/weseek/growi-docker-compose.git growi
cd growi
cp examples/growi-unique-ogp/docker-compose.override.yml .
```

### Add environment variables to `app` container

| variables               | example values                  | description                                                                                                       |
| ----------------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `OGP_URI`            | `https://CHANGE-HERE` | OGP_URI<br>which can be accessed from GROWI |


1. Open `docker-compose.yml`
2. Edit `app` container's settings
  1. Set `OGP_URI`

Please add OGP_URI as follows in docker-compose.yml
```yml
environment:
  - MONGO_URI=mongodb://mongo:27017/growi
  - ELASTICSEARCH_URI=http://elasticsearch:9200/growi
  - PASSWORD_SEED=changeme
  # add
  - OGP_URI=http://ogp:8088
```

### Start

```bash
docker-compose up
```

and access to:

* http://localhost:8088 (OGP server directly)

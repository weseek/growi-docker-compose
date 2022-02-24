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
3. Set `OGP_URI`

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

- access to the following URL for confirmation

* http://localhost:3000/ogp/<page_id> (OGP server directly)

### Setting to publish ogp on the internet

1. access to http://localhost:3000/admin/security
2. update Guest users access to Accept(Guests can read only)

![accept_guests_can_read_only](https://user-images.githubusercontent.com/83065937/155471123-397a71b4-296c-4ca0-bf65-d03cdf8da0bc.PNG)

1. access to http://localhost:3000/admin/app
2. update Site URL settings(Database URL) to your URL to be published as follows

![ogp_url_setting](https://user-images.githubusercontent.com/83065937/155470209-8514ba80-4fd9-4f83-9972-dee6d6417a3d.PNG)

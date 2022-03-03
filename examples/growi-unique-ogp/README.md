growi-docker-compose with growi-unique-ogp Integration Example
=====================================================

This example enables GROWI to integrate with growi-unique-ogp
so that the user will be able to generate ogp.

Install and Start
------------------

### Clone repos and copy docker-compose.override.yml

```bash
git clone https://github.com/weseek/growi-docker-compose.git growi
cd growi
cp examples/growi-unique-ogp/docker-compose.override.yml .
```

### Add environment variables to the `app` container

| variables               | example values                  | description                                                                                                       |
| ----------------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `OGP_URI`            | `https://CHANGE-HERE` | OGP_URI<br>which can be accessed from GROWI |


1. Open `docker-compose.yml`
2. Edit the `app` container's settings
3. Set `OGP_URI`

Please add OGP_URI as follows to your docker-compose.yml
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

### Setting ogp to publish on the internet

1. Access http://localhost:3000/admin/security
2. Update "Guest Users Access" to "Accept(Guests can read only)"

![accept_guests_can_read_only](https://user-images.githubusercontent.com/83065937/155471123-397a71b4-296c-4ca0-bf65-d03cdf8da0bc.PNG)

1. Access to http://localhost:3000/admin/app
2. Update Site URL settings(Database URL) to your URL that will be published on the internet as follows:

![ogp_url_setting](https://user-images.githubusercontent.com/83065937/155470209-8514ba80-4fd9-4f83-9972-dee6d6417a3d.PNG)

1. Access http://localhost:3000/admin/app
2. Update File Upload Settings 
3. The below image shows the case where MongoDB file upload system is used

![file_upload_setting](https://user-images.githubusercontent.com/83065937/155473751-8e7f63d0-787a-4953-be25-789fa1ed78ff.PNG)

### Check

Access the following URL to check page OGP image directly

* http://localhost:3000/ogp/<PAGE_ID>

Paste the following URL to Slack, other SNS, and pages to make sure OGP is displayed

* <YOUR_SITE_URL>/<PAGE_PATH>
* Example: https://growi.org/page-path
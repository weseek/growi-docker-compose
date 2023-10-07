growi-docker-compose with backup MongoDB container example
===================================================

Introduction
-----------

GROWI stores page/user data in MongoDB.

This guide shows you how to backup MongoDB on a regular basis with [weseek/mongodb-awesome-backup](https://github.com/weseek/mongodb-awesome-backup).

Requirements
-----------

- AWS S3 buckets and IAM account to store backup files
- GCS buckets and GCP account to store backup files

## Quick start

0. Clone repos
    ```
    git clone https://github.com/weseek/growi-docker-compose.git growi
    cd growi
    ```
1. Copy `docker-compose.override.yml` to local repos root
    ```
    cp -p examples/backup-mongodb-data/docker-compose.override.yml .
    ```
2. Create file `.env` to set environment variables for AWS or GCS.
    * AWS S3 buckets
        ```
        AWS_ACCESS_KEY_ID=${Your IAM Access Key ID}
        AWS_SECRET_ACCESS_KEY=${Your IAM Secret Access Key}
        ```
    * GCS buckets
        ```
        GCP_PROJECT_ID=${Your GCP Project ID}
        GCP_SERVICE_ACCOUNT_KEY_JSON_PATH=${Path to your GCP Service Account Key}
        ```
        or
        ```
        GCP_PROJECT_ID=${Your GCP Project ID}
        GCP_ACCESS_KEY_ID=${Your GCS HMAC Access ID}
        GCP_SECRET_ACCESS_KEY=${Your GCS HMAC Secret}
        ```
3. Edit `docker-compose.override.yml`
    - Set `CRONMODE` to `true` and `CRON_EXPRESSION` to specify the timing when you execute mongodb-awesome-backup.
    - Set `TARGET_BUCKET_URL` to valid URL of S3 or GCS bucket.
4. Execute GROWI with backup
    - `docker-compose up`

Then the backup container will be launched and it will backup MongoDB data to S3 or GCS.


## Configurations

You can use these and more environment values in `environment` section in `docker-compose.override.yml`.

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- GCP_SERVICE_ACCOUNT_KEY_JSON_PATH
- GCP_ACCESS_KEY_ID
- GCP_SECRET_ACCESS_KEY
- GCP_PROJECT_ID
- TARGET_BUCKET_URL
- BACKUPFILE_PREFIX
- MONGODB_HOST
- MONGODB_DBNAME
- MONGODB_USERNAME
- MONGODB_PASSWORD
- MONGODB_AUTHDB

For details, see the original site [weseek/mongodb-awesome-backup](https://github.com/weseek/mongodb-awesome-backup).


## Optional settings

### If you don't want to create environment file, you need to specify these in `docker-compose.override.yml`.

```yaml:docker-compose.override.yml
    : <snip>
  backup:
    image: weseek/mongodb-awesome-backup:0.6.3
    environment:
      - CRONMODE=true
      - CRON_EXPRESSION=0 4 * * *  
      - TARGET_BUCKET_URL=s3://${REPLACE_THIS_TO_YOUR_BUCKET_NAME}/
      - AWS_ACCESS_KEY_ID=${Your IAM Access Key ID}
      - AWS_SECRET_ACCESS_KEY=${Your IAM Secret Access Key}
    links:
      - mongo:mongo
    : <snip>
```


# Note

"mongodb-awesome-backup" is a backup container.  
For more information, see the original site [weseek/mongodb-awesome-backup](https://github.com/weseek/mongodb-awesome-backup).


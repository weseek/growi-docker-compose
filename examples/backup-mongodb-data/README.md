growi-docker-compose with backup MongoDB container example
===================================================

Introduction
-----------

GROWI stores page/user data in MongoDB.

This guide shows you how to backup MongoDB on a regular basis with [weseek/mongodb-awesome-backup](https://github.com/weseek/mongodb-awesome-backup).

Requirements
-----------

- AWS S3 buckets and IAM account to store backup files

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
2. Create file `.env/SOME_FILE_NAME` to set environment variables for AWS.
    ```
    AWS_ACCESS_KEY_ID=${Your IAM Access Key ID}
    AWS_SECRET_ACCESS_KEY=${Your IAM Secret Access Key}
    ```
3. Copy config file of 'crond' to local repos root
    ```
    cp -rp examples/backup-mongodb-data/crontab .
    ```
4. Edit `./crontab/root` and specify the timing when you execute mongodb-awesome-backup.
5. Set file permission `./crontab/root` to `root:root`.
6. Edit `docker-compose.override.yml`
    - Set `S3_TARGET_BUCKET_URL` to valid URL of S3 bucket.
    - Set `SOME_FILE_NAME` to valid path of environment file you create.
7. Execute GROWI with backup
    - `docker-compose up`

Then the backup container will be launched and it will backup MongoDB data to S3.


## Configurations

You can use these environment values in `environment` section in `docker-compose.override.yml`.

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- S3_TARGET_BUCKET_URL
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
    image: weseek/mongodb-awesome-backup:0.2.0
    environment:
      - CRONMODE=true
      - S3_TARGET_BUCKET_URL=s3://${REPLACE_THIS_TO_YOUR_BUCKET_NAME}/
      - AWS_ACCESS_KEY_ID=${Your IAM Access Key ID}
      - AWS_SECRET_ACCESS_KEY=${Your IAM Secret Access Key}
    links:
      - mongo:mongo
    volumes:
      - ./crontab/root:/var/spool/cron/crontabs/root
    : <snip>
```


# Note

"mongodb-awesome-backup" is a backup container.  
For more information, see the original site [weseek/mongodb-awesome-backup](https://github.com/weseek/mongodb-awesome-backup).


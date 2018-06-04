growi-docker-compose with backup example
========================================

# Introduction

GROWI stores page/user data in MongoDB.

This guide shows you how to backup MongoDB if you use [weseek/mongodb-awesome-backup](https://github.com/weseek/mongodb-awesome-backup).

# How to backup with "weseek/mongodb-awesome-backup"

We show you how to backup if you use Growi in docker-compose environment.

## Requirements

- AWS S3 buckets and IAM account to store backup files

## Quick start

0. Clone repos
    `git clone https://github.com/weseek/growi-docker-compose.git growi`
1. Copy `docker-compose.override.yml` to above directory
    `cp -p examples/with-backup/docker-compose.override.yml growi`
2. Create file `.env/SOME_FILE_NAME` to set environment variables for AWS.
    ```
    AWS_ACCESS_KEY_ID=${Your IAM Access Key ID}
    AWS_SECRET_ACCESS_KEY=${Your IAM Secret Access Key}
    ```
3. Copy config file of crond `./crontab/root`, and specify the timing when you execute mongodb-awesome-backup.
4. Set file permission `./crontab/root` to `root:root`.
5. Edit `docker-compose.yml` these values
    - Set `S3_TARGET_BUCKET_URL` to valid URL of S3 bucket.
    - Set `SOME_FILE_NAME` to valid path of environment file you create.

Then the backup container will be launched and it will backup MongoDB data to S3.

6. Execute GROWI with backup
    - `docker-compose up`

## Configurations

You can use these environment values in `environment` section in docker-compose.yml.

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

### If you don't want to create environment file, you need to specify these in `docker-compose.yml`.

```yaml:docker-compose.yml
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


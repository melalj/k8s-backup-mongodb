# Schedule MongoDB Backup to S3 using Kubernetes CronJob

## Backup

```sh
DB_NAME=""
MONGODB_URI="mongodb://..."
BUCKET_URI="s3://bucket-name"
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_DEFAULT_REGION=""
/scripts/backup-mongodb.sh
```

## Restore

```sh
RESTORE_ARCHIVE_NAME=""
DB_NAME=""
MONGODB_URI="mongodb://..."
BUCKET_URI="s3://bucket-name"
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_DEFAULT_REGION=""
/scripts/restore-mongodb.sh
```

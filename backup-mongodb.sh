#!/bin/bash

set -e

SCRIPT_NAME=backup-mongodb
ARCHIVE_NAME=${DB_NAME}_$(date +%Y%m%d_%H%M%S).gz

echo "[$SCRIPT_NAME] Dumping MongoDB databases ${DB_NAME} to compressed archive..."
mongodump "${RESTORE_EXTRA_PARAMS}" \
	--authenticationDatabase "$AUTH_DB_NAME" \
	--db "$DB_NAME" \
	--archive="$ARCHIVE_NAME" \
	--gzip \
	--uri "$MONGODB_URI"

echo "[$SCRIPT_NAME] Uploading ${ARCHIVE_NAME} to S3 bucket..."
aws s3 cp "$ARCHIVE_NAME" "$BUCKET_URI"

echo "[$SCRIPT_NAME] Cleaning up compressed archive..."
rm "$ARCHIVE_NAME"

echo "[$SCRIPT_NAME] Backup complete!"

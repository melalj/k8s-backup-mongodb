#!/bin/bash

set -e

SCRIPT_NAME=restore-mongodb

echo "[$SCRIPT_NAME] Downloading ${RESTORE_ARCHIVE_NAME}..."
aws s3 cp "$BUCKET_URI/$RESTORE_ARCHIVE_NAME" "$RESTORE_ARCHIVE_NAME"

echo "[$SCRIPT_NAME] Restore MongoDB databases ${DB_NAME} from compressed archive..."
mongorestore \
	--authenticationDatabase "$AUTH_DB_NAME" \
	--db "$DB_NAME" \
	--gzip \
	--uri "$MONGODB_URI" \
	"$RESTORE_ARCHIVE_NAME"


echo "[$SCRIPT_NAME] Cleaning up compressed archive..."
rm "$RESTORE_ARCHIVE_NAME"

echo "[$SCRIPT_NAME] restore complete!"

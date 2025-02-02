#!/bin/bash

set -e

SCRIPT_NAME=restore-mongodb

echo "[$SCRIPT_NAME] Downloading ${RESTORE_ARCHIVE_NAME}..."
aws s3 cp "$BUCKET_URI/$RESTORE_ARCHIVE_NAME" "$RESTORE_ARCHIVE_NAME"

echo "[$SCRIPT_NAME] Restore MongoDB databases ${DB_NAME} from compressed archive..."

mongorestore "${RESTORE_EXTRA_PARAMS}" \
	--authenticationDatabase "$AUTH_DB_NAME" \
	--nsInclude="$DB_NAME" \
	--uri "$MONGODB_URI" \
	--gzip \
	--archive="$RESTORE_ARCHIVE_NAME"


echo "[$SCRIPT_NAME] Cleaning up compressed archive..."
rm "$RESTORE_ARCHIVE_NAME"

echo "[$SCRIPT_NAME] restore complete!"

#!/bin/bash

SOURCE_DIR=~/personal
BACKUP_DIR=~
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BACKUP_NAME="backup_archive_$TIMESTAMP"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

cp -r "$SOURCE_DIR" "$BACKUP_PATH"
BACKUP_COUNT=$(ls -dt "$BACKUP_DIR"/backup_archive_* | wc -l)
if [ "$BACKUP_COUNT" -gt 3 ]; then
	TO_DELETE=$(ls -dt "$BACKUP_DIR"/backup_archive_* | tail -n +4)
	rm -rf "$TO_DELETE"
fi

#!/bin/bash
USER=$1
PASS=$2
DB_NAME=$3
HOST=$4
BUCKET_NAME=$5
AWS=$6
AWS_ID=${AWS%:*}
AWS_PASS=${AWS#*:}


export AWS_ACCESS_KEY_ID=$AWS_ID
export AWS_SECRET_ACCESS_KEY=$AWS_PASS

BACKUP_NAME="backup $DB_NAME $(date +%d-%m-%Y_%l:%M:%S).sql"

mysqldump -u $USER -h $HOST -p$PASS $DB_NAME > "/tmp/$BACKUP_NAME" && \
aws s3 cp "/tmp/$BACKUP_NAME" s3://$BUCKET_NAME

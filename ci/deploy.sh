#!/bin/bash

LOGFILE=/var/log/docker-update.log
TEMP_ENV_FILE=/tmp/env-temp
DEST_DIR=/home/ubuntu/deployment
DEST_USERNAME=ubuntu
DEST=1.2.3.4

function log() {
    echo "$1"
    echo "$1" > $LOGFILE
}

function check_result() {
  if [ "$?" == "0" ]
  then
    log "[ OK ] $1"
  else
    log "[FAIL] $1"
    exit 1
  fi
}

log "Update Environment file"
cat <<EOF > $TEMP_ENV_FILE
APP_IMAGE_NAME=$APP_IMAGE_NAME
GOOGLE_CLIENT_ID=$GOOGLE_CLIENT_ID
GOOGLE_CLIENT_SECRET=$GOOGLE_CLIENT_SECRET
JWT_SECRET=$JWT_SECRET
HASURA_GRAPHQL_ADMIN_SECRET=$HASURA_GRAPHQL_ADMIN_SECRET
APP_DOMAIN=$APP_DOMAIN
HASURA_DOMAIN=$HASURA_DOMAIN
LETSENCRYPT_EMAIL=$LETSENCRYPT_EMAIL
JWT_PUBLIC=$JWT_PUBLIC
EOF

scp $TEMP_ENV_FILE $DEST_USERNAME@$DEST_DIR:$DEST_DIR/.env
check_result "Upload env file"

log "Upload Docker Compose file"

scp ./ci/docker-compose.yml $DEST_USERNAME@$DEST_DIR:$DEST_DIR/docker-compose.yml
check_result "Upload env file"





# Update docker-compose
log "Update Docker compose status"

docker-compose pull
check_result "Docker Compose Pull"

docker-compose restart
check_result "Docker Compose Restart"




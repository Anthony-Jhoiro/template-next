#!/bin/bash

LOGFILE=/var/log/docker-update.log

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
cat <<EOF > .env
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


# Update docker-compose
log "Update Docker compose status"

docker-compose pull
check_result "Docker Compose Pull"

docker-compose restart
check_result "Docker Compose Restart"




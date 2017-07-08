#!/usr/bin/env bash

if [[ $(ipconfig getifaddr en1) ]]; then
    export OGP_XDEBUG_HOST=$(ipconfig getifaddr en1)
elif [[ $(ipconfig getifaddr en0) ]]; then
    export OGP_XDEBUG_HOST=$(ipconfig getifaddr en0)
else
    export OGP_XDEBUG_HOST=10.254.254.254
fi

docker-compose up -d --force-recreate
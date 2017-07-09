#!/usr/bin/env bash

if [[ $(ipconfig getifaddr en1) ]]; then
    export OGP_XDEBUG_HOST=$(ipconfig getifaddr en1)
elif [[ $(ipconfig getifaddr en0) ]]; then
    export OGP_XDEBUG_HOST=$(ipconfig getifaddr en0)
else
    # Make an alias IP address that really just points to your en0 interface, we'll use this alias within the container
    sudo ifconfig en0 alias 10.254.254.254 255.255.255.0
    export OGP_XDEBUG_HOST=10.254.254.254
fi

# Now that OGP_XDEBUG_HOST is set, lets call the docker compose up command which will use this env var.
docker-compose up -d --force-recreate
#!/bin/bash

set -e

umask u+rxw,g+rwx,o-rwx

if [ "$NPM_REGISTRY_MIRROR" != "false" ]
then
    echo ">> DOCKER-ENTRYPOINT: INJECTING NPM REGISTRY MIRROR WITH URL: ${NPM_REGISTRY_MIRROR}"
    npm config set registry ${NPM_REGISTRY_MIRROR}
fi

exec "$@"
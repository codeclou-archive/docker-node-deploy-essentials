# docker-node-deploy-essentials

## :bangbang: Deprecated and Discontinued :bangbang:

[![](https://codeclou.github.io/doc/badges/generated/docker-image-size-29.svg)](https://hub.docker.com/r/codeclou/docker-node-deploy-essentials/tags/) [![](https://codeclou.github.io/doc/badges/generated/docker-from-alpine-3.5.svg)](https://alpinelinux.org/) [![](https://codeclou.github.io/doc/badges/generated/docker-run-as-non-root.svg)](https://docs.docker.com/engine/reference/builder/#/user)

Docker-Image to use [node-deploy-essentials](https://github.com/codeclou/node-deploy-essentials).

-----
&nbsp;

### Prerequisites

 * Runs as non-root with fixed UID 10777 and GID 10777. See [howto prepare volume permissions](https://github.com/codeclou/doc/blob/master/docker/README.md).
 * See [howto use SystemD for named Docker-Containers and system startup](https://github.com/codeclou/doc/blob/master/docker/README.md).


-----
&nbsp;

### Usage

You can use any command provided by [node-deploy-essentials](https://github.com/codeclou/node-deploy-essentials) like so.

```
echo "bla bla ___TIMEST___ foo bar" > test.txt

docker run \
    -i -t --rm \
    -v $(pwd)/:/opt/npm \
    codeclou/docker-node-deploy-essentials:latest \
    ndes replace "___TIMEST___" byCurrentTimetamp in "test.txt"

cat test.txt
# will show something like 
bla bla 2016-07-25T20:50:23.722Z foo bar
```

You can also use this image to build something with npm like this:
 
```
docker run \
    -i -t \
    -v $(pwd)/:/opt/npm \
    -e NPM_REGISTRY_MIRROR='http://nopar.foo.com/' \
    codeclou/docker-node-deploy-essentials:latest \
    npm install
```

Via the optional environment variable `NPM_REGISTRY_MIRROR` you can specify an npm repository mirror,
which will be set internally as `npm config set registry http://nopar.foo.com/`

-----
&nbsp;

### License, Liability & Support

 * [![](https://codeclou.github.io/doc/docker-warranty-notice.svg?v1)](https://github.com/codeclou/docker-node-deploy-essentials/blob/master/LICENSE.md)
 * Dockerfile and Image is provided under [MIT License](https://github.com/codeclou/docker-node-deploy-essentials/blob/master/LICENSE.md)

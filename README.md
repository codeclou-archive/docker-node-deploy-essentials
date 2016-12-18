# docker-node-deploy-essentials
Docker image to use [node-deploy-essentials](https://github.com/codeclou/node-deploy-essentials).

### Usage

You can use any command provided by [node-deploy-essentials](https://github.com/codeclou/node-deploy-essentials) like this

```
echo "bla bla ___TIMEST___ foo bar" > test.txt

docker run --tty --volume $(pwd)/:/opt/npm codeclou/docker-node-deploy-essentials:latest ndes replace "___TIMEST___" byCurrentTimetamp in "test.txt"

cat test.txt
# will show something like 
bla bla 2016-07-25T20:50:23.722Z foo bar
```

### License

  * Dockerfile and Image is provided under [MIT License](https://github.com/codeclou/docker-node-deploy-essentials/blob/master/LICENSE.md)

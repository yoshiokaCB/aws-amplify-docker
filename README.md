# aws-cdk-docker

## set

```
$ cp env.list.sample env.list
$ vi env.list
AWS_ACCESS_KEY=[your_access_key]
AWS_SECRET_ACCESS_KEY=[your_secret_access_key]
REGION=ap-northeast-1
OUTPUT=text
```

## build

```
$ docker build -t aws-amplify . --no-cache
```

## start

```
$ docker run --rm -it --env-file ./env.list -v `pwd`:/usr/src/ -p 3000:3000 aws-amplify /bin/bash
```

## example

```
$ npx create-react-app my-app hello-world
```

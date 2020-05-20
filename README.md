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

Example of how to make react application

create react project

```
$ docker run --rm -it --env-file ./env.list -v `pwd`:/usr/src/ aws-amplify npx create-react-app my-app
```

replace working directory

```
vi Dockerfile
```

```
- WORKDIR /usr/src
+ WORKDIR /usr/src/my-app
```

```
$ docker build -t aws-amplify .
```

start server

```
$ docker run --rm -itd --env-file ./env.list -v `pwd`:/usr/src/ -p 3000:3000 aws-amplify yarn start
```

start amplify mock api

```
$ docker run --rm -itd --env-file ./env.list -v `pwd`:/usr/src/ -p 20002:20002 aws-amplify amplify mock api
```

```
$ docker stop [docker id]
```


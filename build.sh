#!/bin/bash

PROJ="dart-grpc-logger"
REPO="github.com/DazWilkin/${PROJ}"

ARCH="linux-x86_64"
VERS="3.12.3"

PATH=${PATH}:${PWD}/protoc-${VERS}-${ARCH}/bin

protoc \
--proto_path=./protos \
--go_out=plugins=grpc,module=${REPO}:. \
protos/*.proto


TAG=$(git rev-parse HEAD)
for IMAGE in server client dart
do
  docker build \
  --tag=dazwilkin/${PROJ}-${IMAGE}:${TAG} \
  --file=./deployment/Dockerfile.${IMAGE} \
  .
done

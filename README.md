# Dart-based gRPC Logger

[![build](https://github.com/DazWilkin/dart-grpc-logger/actions/workflows/build.yml/badge.svg)](https://github.com/DazWilkin/dart-grpc-logger/actions/workflows/build.yml)

+ `ghcr.io/dazwilkin/dart-grpc-logger/server:35305a8200ec929e5f19a9c4dbfd448082584866`
+ `ghcr.io/dazwilkin/dart-grpc-logger/client:35305a8200ec929e5f19a9c4dbfd448082584866`

## Run

In one terminal, run the server:

```bash
GRPC="50051"

docker run \
--interactive --tty \
--publish=${GRPC}:${GRPC} \
ghcr.io/dazwilkin/dart-grpc-logger/server:35305a8200ec929e5f19a9c4dbfd448082584866 \
--grpc_endpoint=:${GRPC}
```

> **NOTE** While the server can be reconfigured to run on any available port `--grpc_endpoint=...`, the Dart client requires `localhost:50051` because my Dart skills are limited.

The server logs then pauses on a client:

```
2020/06/05 20:49:36 [main] Starting gRPC Logger Server
2020/06/05 20:49:36 [main] Creating a gRPC Server
2020/06/05 20:49:36 Starting gRPC Listener [:50051]
```

In another terminal, run the client:

```bash
docker run \
--interactive \
--tty \
--net=host \
ghcr.io/dazwilkin/dart-grpc-logger/client:35305a8200ec929e5f19a9c4dbfd448082584866
```

The client logs:

```
[Client:main] Entered
[Client:main] Configuring channel
[Client:main] Creating gRPC Logger Client
[Client:runSaveLogs] Entered
[Client:generateLogs] Count=10
[Client:generateLogs] Batch=1
[Client:generateLogs] Batch=4
[Client:generateLogs] Batch=4
[Client:generateLogs] Batch=4
[Client:generateLogs] Batch=7
[Client:generateLogs] Batch=8
[Client:generateLogs] Batch=7
[Client:generateLogs] Batch=7
[Client:generateLogs] Batch=8
[Client:generateLogs] Batch=9
[Client:runSaveLogs] Finished
```

The server logs:

```bash
2020/06/05 20:49:47 [Server:SaveLogs] 2020-06-05T20:49:47Z Entered
2020/06/05 20:49:48 [Server:SaveLogs] Received 1 logs
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] Received 4 logs
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] Received 4 logs
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] Received 4 logs
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:48 [Server:SaveLogs] 2020-06-05T20:49:48Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] Received 7 logs
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] Received 8 logs
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] Received 7 logs
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] Received 7 logs
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:49 [Server:SaveLogs] 2020-06-05T20:49:49Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] Received 8 logs
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] Received 9 logs
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z Log: test
2020/06/05 20:49:50 [Server:SaveLogs] 2020-06-05T20:49:50Z EOF
```

## Golang

### Summary

```bash
MODULE="github.com/DazWilkin/dart-grpc-logger"
```

and:

```bash
go mod init ${MODULE}
```

and:

```bash
protoc \
--proto_path=${PWD}/protos \
--go_out=${PWD} \
--go_opt=module=${MODULE} \
--go-grpc_out=${PWD} \
--go-grpc_opt=module=${MODULE} \
${PWD}/protos/*.proto
```

### Build

```bash
docker build \
--tag=ghcr.io/dazwilkin/dart-grpc-logger/server:$(git rev-parse HEAD) \
--file=${PWD}/Dockerfiles/Dockerfile.server \
${PWD}
```

### Run

```bash
GRPC="50051"
docker run \
--interactive --tty \
--publish=${GRPC}:${GRPC} \
ghcr.io/dazwilkin/dart-grpc-logger/server:$(git rev-parse HEAD)
```

Or:

```bash
GRPC="50051"
go run ./cmd/server \
--grpc_endpoint=:${GRPC}
```

There's a Golang client too:

```bash
GRPC="50051"
go run ./cmd/client \
--gprc_endpoint=${GRPC}
```

## Dart

Work with Dart without installing Dart SDK locally:

```bash
VERS="3.0.5"

docker run \
--interactive \
--tty \
--net=host \
--volume=${PWD}:/app \
docker.io/dart:${VERS} \
  bash
```

and:

```bash
# Install protoc plugin and add it to PATH
pub global activate protoc_plugin
PATH=${PATH}:/root/.pub-cache/bin

cd /app
PATH=${PATH}:${PWD}/protoc-23.4-linux-x86_64/bin

protoc \
--proto_path=${PWD}/protos \
--proto_path=${PWD}/protoc-23.4-linux-x86_64/include \
--dart_out=grpc:protos \
${PWD}/protos/logger.proto \
${PWD}/protoc-23.4-linux-x86_64/include/google/protobuf/timestamp.proto
```

Then:

```dart
import '../protos/google/protobuf/timestamp.pb.dart';
import '../protos/logger.pb.dart';
import '../protos/logger.pbenum.dart';
import '../protos/logger.pbgrpc.dart';
import '../protos/logger.pbjson.dart';
```

And:

```bash
pub get
dart dart/client.dart
```

## [Sigstore](https://www.sigstore.dev/)

The container images are being signed by [Sigstore](https://www.sigstore.dev) and may be verified:
```bash
cosign verify \
--key=${PWD}/cosign.pub \
ghcr.io/dazwilkin/dart-grpc-logger/client:35305a8200ec929e5f19a9c4dbfd448082584866 \
ghcr.io/dazwilkin/dart-grpc-logger/server:35305a8200ec929e5f19a9c4dbfd448082584866
```

> **NOTE** `cosign.pub` may be downloaded [here](/cosign.pub)

To install cosign:
```bash
go install github.com/sigstore/cosign/cmd/cosign@latest
```

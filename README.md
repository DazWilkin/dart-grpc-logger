# Dart-based gRPC Logger

## Run

In one terminal, run the server:

```bash
docker run \
--interactive --tty \
--publish=50051:50051 \
dazwilkin/dart-grpc-logger-server:84a06d9cc166692ddf00c941856c96e853594695
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
dazwilkin/dart-grpc-logger-client:84a06d9cc166692ddf00c941856c96e853594695
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
--proto_path=./protos \
--go_out=plugins=grpc,module=${MODULE}:. \
protos/*.proto
```

### Build

```bash
docker build \
--tag=dazwilkin/dart-grpc-logger-server:$(git rev-parse HEAD) \
--file=./deployment/Dockerfile.server \
.
```

### Run

```bash
GRPC="50051"
docker run \
--interactive --tty \
--publish=${GRPC}:${GRPC} \
dazwilkin/dart-grpc-logger-server:$(git rev-parse HEAD)
```

Or:

```bash
GRPC="50051"
go run ./cmd/server --grpc_endpoint=:${GRPC}
```

There's a Golang client too:

```bash
GRPC="50051"
go run ./cmd/client --gprc_endpoint=${GRPC}
```

## Dart

Work with Dart without installing Dart SDK locally:

```bash
docker run \
--interactive \
--tty \
--net=host \
--volume=${PWD}:/app \
docker.io/google/dart \
  bash
```

and:

```bash
# Install protoc plugin and add it to PATH
dart pub global activate protoc_plugin
PATH=${PATH}:/root/.pub-cache/bin

cd /app
PATH=${PATH}:${PWD}/protoc-3.12.0-linux-x86_64/bin

protoc \
--dart_out=grpc:protos \
--proto_path=./protos \
--proto_path=./protoc-3.12.0-linux-x86_64/include \
./protos/logger.proto \
./protoc-3.12.0-linux-x86_64/include/google/protobuf/timestamp.proto
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

ARG PROJECT="dart-grpc-logger"

ARG DART_VERSION="3.5.0"

ARG VERS="28.0"
ARG ARCH="linux-x86_64"

FROM docker.io/dart:${DART_VERSION}

LABEL org.opencontainers.image.source https://github.com/DazWilkin/dart-grpc-logger

# Installs protoc and plugins: (Dart) protoc-gen-go
ARG VERS
ARG ARCH
RUN apt update && \
    apt install -y unzip wget && \
    wget https://github.com/protocolbuffers/protobuf/releases/download/v${VERS}/protoc-${VERS}-${ARCH}.zip --output-document=/protoc-${VERS}-${ARCH}.zip && \
    unzip -o /protoc-${VERS}-${ARCH}.zip -d /protoc-${VERS}-${ARCH} && \
    rm /protoc-${VERS}-${ARCH}.zip && \
    mv /protoc-${VERS}-${ARCH}/bin/* /usr/local/bin && \
    mv /protoc-${VERS}-${ARCH}/include/* /usr/local/include

RUN dart pub global activate protoc_plugin
ENV PATH=${PATH}:/root/.pub-cache/bin

ARG PROJECT

WORKDIR /${PROJECT}

COPY dart dart
COPY protos protos
COPY pubspec.yaml pubspec.yaml

# Generates the Dart protobuf files including for google/protobuf/timestamp.proto
RUN protoc \
    --proto_path=/usr/local/include \
    --proto_path=${PWD}/protos \
    --dart_out=grpc:${PWD}/protos \
    ${PWD}/protos/logger.proto \
    /usr/local/include/google/protobuf/timestamp.proto

RUN dart pub get

ENTRYPOINT ["dart","./dart/client.dart"]

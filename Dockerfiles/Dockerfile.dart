ARG PROJECT="dart-grpc-logger"

ARG VERS="23.4"
ARG ARCH="linux-x86_64"

FROM google/dart

LABEL org.opencontainers.image.source https://github.com/dazwilkin/dart-grpc-logger

# Installs protoc and plugins: (dart) protoc-gen-go
ARG VERS
ARG ARCH
RUN apt update && \
    apt install -y unzip wget && \
    wget https://github.com/protocolbuffers/protobuf/releases/download/v${VERS}/protoc-${VERS}-${ARCH}.zip --output-document=/protoc-${VERS}-${ARCH}.zip && \
    unzip -o /protoc-${VERS}-${ARCH}.zip -d /protoc-${VERS}-${ARCH} && \
    rm /protoc-${VERS}-${ARCH}.zip && \
    mv /protoc-${VERS}-${ARCH}/bin/* /usr/local/bin && \
    mv /protoc-${VERS}-${ARCH}/include/* /usr/local/include

RUN pub global activate protoc_plugin
RUN PATH=${PATH}:/root/.pub-cache/bin

ARG PROJECT

WORKDIR /${PROJECT}

COPY dart dart

# Generates the Dart protobuf files including for google/protobuf/timestamp.proto
RUN protoc \
    --proto_path=/usr/local/include \
    --proto_path=./protos \
    --dart_out=grpc:./protos \
    ./protos/logger.proto \
    /usr/local/include/google/protobuf/timestamp.proto

RUN pub get

ENTRYPOINT ["dart","./dart/client.dart"]

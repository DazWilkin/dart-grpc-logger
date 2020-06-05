FROM google/dart

# Installs protoc and plugins: (dart) protoc-gen-go
ARG VERS="3.12.3"
ARG ARCH="linux-x86_64"
RUN apt update && \
    apt install -y unzip wget && \
    wget https://github.com/protocolbuffers/protobuf/releases/download/v${VERS}/protoc-${VERS}-${ARCH}.zip --output-document=/protoc-${VERS}-${ARCH}.zip && \
    unzip -o /protoc-${VERS}-${ARCH}.zip -d /protoc-${VERS}-${ARCH} && \
    rm /protoc-${VERS}-${ARCH}.zip && \
    mv /protoc-${VERS}-${ARCH}/bin/* /usr/local/bin && \
    mv /protoc-${VERS}-${ARCH}/include/* /usr/local/include

RUN pub global activate protoc_plugin
RUN PATH=${PATH}:/root/.pub-cache/bin

ARG PROJ="dart-grpc-logger"
ARG REPO="github.com/DazWilkin/${PROJ}"

RUN git clone https://${REPO}.git /${PROJ}

WORKDIR /${PROJ}

# Generates the Dart protobuf files including for google/protobuf/timestamp.proto
RUN protoc \
    --proto_path=/usr/local/include \
    --proto_path=./protos \
    --dart_out=grpc:./protos \
    ./protos/logger.proto \
    /usr/local/include/google/protobuf/timestamp.proto

RUN pub get

ENTRYPOINT ["dart","./dart/client.dart"]

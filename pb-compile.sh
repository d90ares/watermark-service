#!/usr/bin/env sh

# Install proto3 from source
#  brew install autoconf automake libtool
#  git clone https://github.com/google/protobuf
#  ./autogen.sh ; ./configure ; make ; make install
#
# Update protoc Go bindings via
#  go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
#
# See also
#  https://github.com/grpc/grpc-go/tree/master/examples

REPO_ROOT="/home/daniloasantos/code/src/github.com/d90ares/watermark-service"
PB_PATH="${REPO_ROOT}/api/v1/pb/"
PROTO_FILE="watermarksvc.proto"


echo "Generating pb files for ${PROTO_FILE} service"
# /usr/bin/protoc --plugin=$(go env GOPATH)/bin/protoc-gen-go-grpc --proto_path="${PB_PATH}" \
#     --go-grpc_out=./watermark --go-grpc_opt=paths=source_relative \
#  watermarksvc.proto

protoc --plugin=$(go env GOPATH)/bin/protoc-gen-go --proto_path="${PB_PATH}" \
  --go_out=./api/v1/pb \
  --go_opt=Mwatermarksvc.proto=/watermark \
  watermarksvc.proto

# protoc --plugin=$(go env GOPATH)/bin/protoc-gen-go-grpc --proto_path="${PB_PATH}" \
#   --go-grpc_out=./api/v1/pb \
#   --go-grpc_opt=Mwatermarksvc.proto=/watermark \
#   watermarksvc.proto
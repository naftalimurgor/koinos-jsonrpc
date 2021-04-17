#!/bin/bash

set -e
set -x

if [[ -z $BUILD_DOCKER ]]; then
   go get ./...
   mkdir -p build
   go build -o build/koinos_jsonrpc cmd/koinos-jsonrpc/main.go
else
   export TAG="$TRAVIS_BRANCH"
   if [ "$TAG" = "master" ]; then
      export TAG="latest"
   fi

   docker build . -t koinos/koinos-jsonrpc:$TAG
fi

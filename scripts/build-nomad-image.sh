#!/bin/bash

# This script is used to build the Docker Image for hippo-nomad for test purposes. 

pushd $PWD
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
cd ..
ROOT_DIR=$PWD

cd $ROOT_DIR

dotnet publish Hippo/Hippo.csproj -c Release --self-contained -r linux-x64

cd $ROOT_DIR/.github/release-image

mkdir -p $ROOT_DIR/Hippo/bin/Release/net5.0/linux-x64/publish/certs
cp localhost.conf $ROOT_DIR/Hippo/bin/Release/net5.0/linux-x64/publish/certs

cd $ROOT_DIR

mkdir -p $ROOT_DIR/Hippo/bin/Release/net5.0/linux-x64/publish/nomad
cp -r scripts/nomad/**  $ROOT_DIR/Hippo/bin/Release/net5.0/linux-x64/publish/nomad

docker build -t hippo-nomad -f  $ROOT_DIR/.github/release-image/nomad/Dockerfile  $ROOT_DIR/Hippo/bin/Release/net5.0/linux-x64/publish
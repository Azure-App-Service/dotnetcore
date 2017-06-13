#!/usr/bin/env bash
set -x -e

docker build -t "$1"/dotnetcore:1.0.5 -t "$1"/dotnetcore:1.0 1.0
docker build -t "$1"/dotnetcore:1.1.2 -t "$1"/dotnetcore:1.1 -t "$1"/dotnetcore:1 -t "$1"/dotnetcore:latest 1.1

docker login -u "$2" -p "$3"

docker push "$1"/dotnetcore:1.0.5
docker push "$1"/dotnetcore:1.0

docker push "$1"/dotnetcore:1.1.2
docker push "$1"/dotnetcore:1.1
docker push "$1"/dotnetcore:1
docker push "$1"/dotnetcore:latest

docker logout
#!/usr/bin/env bash
set -euo pipefail

buildnumber=${4-$(date -u +"%y%m%d%H%M")}

docker build --no-cache -t "$1"/dotnetcore:1.0.14_"$buildnumber" 1.0.14
docker build --no-cache -t "$1"/dotnetcore:1.1.11_"$buildnumber" 1.1.11
docker build --no-cache -t "$1"/dotnetcore:2.0.9_"$buildnumber" 2.0.9
docker build --no-cache -t "$1"/dotnetcore:2.1.8_"$buildnumber" 2.1.8 -t "$1"/dotnetcore:lts_"$buildnumber"
docker build --no-cache -t "$1"/dotnetcore:2.2.2_"$buildnumber" -t "$1"/dotnetcore:latest_"$buildnumber" 2.2.2
docker tag "$1"/dotnetcore:latest_"$buildnumber" "$1"/dotnetcore:latest

docker login -u "$2" -p "$3"

docker push "$1"/dotnetcore:lts_"$buildnumber"
docker push "$1"/dotnetcore:1.0.14_"$buildnumber"
docker push "$1"/dotnetcore:1.1.11_"$buildnumber"
docker push "$1"/dotnetcore:2.0.9_"$buildnumber"
docker push "$1"/dotnetcore:2.1.8_"$buildnumber"
docker push "$1"/dotnetcore:2.2.2_"$buildnumber"

docker push "$1"/dotnetcore:latest_"$buildnumber"
docker push "$1"/dotnetcore:latest

docker logout

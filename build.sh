#!/usr/bin/env bash
set -euo pipefail

buildnumber=${4-$(date -u +"%y%m%d%H%M")}

docker build --no-cache -t "$1"/dotnetcore:1.0.5_"$buildnumber" -t "$1"/dotnetcore:lts_"$buildnumber" 1.0.5
docker build --no-cache -t "$1"/dotnetcore:1.1.2_"$buildnumber" 1.1.2
docker build --no-cache -t "$1"/dotnetcore:2.0.0_"$buildnumber" 2.0.0
docker build --no-cache -t "$1"/dotnetcore:2.0.5_"$buildnumber" 2.0.5
docker build --no-cache -t "$1"/dotnetcore:2.0.7_"$buildnumber" -t "$1"/dotnetcore:latest_"$buildnumber" 2.0.7
docker tag "$1"/dotnetcore:latest_"$buildnumber" "$1"/dotnetcore:latest

docker login -u "$2" -p "$3"

docker push "$1"/dotnetcore:lts_"$buildnumber"
docker push "$1"/dotnetcore:1.0.5_"$buildnumber"
docker push "$1"/dotnetcore:1.1.2_"$buildnumber"
docker push "$1"/dotnetcore:2.0.0_"$buildnumber"
docker push "$1"/dotnetcore:2.0.5_"$buildnumber"
docker push "$1"/dotnetcore:2.0.7_"$buildnumber"
docker push "$1"/dotnetcore:latest_"$buildnumber"
docker push "$1"/dotnetcore:latest

docker logout

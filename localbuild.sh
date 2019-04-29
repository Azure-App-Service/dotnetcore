#!/usr/bin/env bash
set -euo pipefail

buildnumber=${4-$(date -u +"%y%m%d%H%M")}

docker build --no-cache -t "$1"/dotnetcore:2.2.2_"$buildnumber" -t "$1"/dotnetcore:latest_"$buildnumber" 2.2.2
docker tag "$1"/dotnetcore:latest_"$buildnumber" "$1"/dotnetcore:latest


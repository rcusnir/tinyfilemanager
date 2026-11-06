#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 || -z "${1:-}" ]]; then
    echo "Usage: $0 <tag>" >&2
    exit 1
fi

tag="$1"
image="${IMAGE_NAME:-rcusnir/tinyfilemanager}"

docker build -t "${image}:${tag}" .
docker tag "${image}:${tag}" "${image}:master"

docker push "${image}:${tag}"
docker push "${image}:master"
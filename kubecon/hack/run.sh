#!/bin/sh

# posix compliant
# verified by https://www.shellcheck.net

# The script takes two arguments, the command and the name of the cluster.
[ "${#}" -eq 2 ] || { echo "usage: ${0} COMMAND NAME"; exit 1 1>&2; }

# If ENV_FILE is the path to a file, use it as the environment variable
# file, otherwise use the project's empty file, empty.env.
[ -f "${ENV_FILE}" ] || ENV_FILE="$(dirname "${0}")/../empty.env"

exec docker run --rm -it --dns 147.75.69.23 --dns 8.8.8.8 \
  -v "$(pwd)/data:/cncf/data" \
  -e BACKEND=file \
  -e CLOUD=kubecon \
  -e COMMAND="${1}" \
  -e NAME="${2}" \
  --env-file="${ENV_FILE}" \
  provisioning

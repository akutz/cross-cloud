#!/bin/sh

# posix compliant
# verified by https://www.shellcheck.net

# The script takes one arguments, the name of the cluster.
[ -n "${1}" ] || { echo "usage: ${0} NAME"; exit 1 1>&2; }

exec "$(dirname "${0}")/run.sh" deploy "${1}"

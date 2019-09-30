#! /bin/bash
#
# Usage: $THIS pt-command [args]
#
# Run percona-toolkit commands inside docker container.  Percona tools can read
# all files under the current directory.  You should change directory to mysql
# log directory before execute before execute it.
#
# Example:
#   cd /var/log/mysql
#   $THIS pt-query-digest --limit=100% slow_query.log > slow_query.pqd
#   NOTE: The slow_query.log is located in the current working directory.
#
# Environment:
#   DOCKER_PERCONA_TOOLKIT: Docker image name for the percona toolkit.
#                           Default: yuuki0xff/percona-toolkit
#                           Current Value: $DOCKER_PERCONA_TOOLKIT

set -eu

# Set default value when value is not defined.
THIS=$0
: "${DOCKER_PERCONA_TOOLKIT:=yuuki0xff/percona-toolkit}"

# Show help
function help {
    export THIS
    export DOCKER_PERCONA_TOOLKIT
    envsubst <"$THIS" |sed '1,2d; /^$/Q; s/^# \?//;'
    exit 1
}

# main
if [ -z "${1:-}" ]; then
    help
fi
docker run --rm -ti -v $(pwd):/mnt:ro -w /mnt "$DOCKER_PERCONA_TOOLKIT" "$@"

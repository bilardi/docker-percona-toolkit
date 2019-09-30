#! /bin/bash
# Environment:
#   DOCKER_PERCONA_TOOLKIT: Docker image name for the percona toolkit  (default: yuuki0xff/percona-toolkit)
set -eu

# Set default value when value is not defined.
: "${DOCKER_PERCONA_TOOLKIT:=yuuki0xff/percona-toolkit}"

# help
function help {
    echo
    echo Usage: $0 pt-command and arguments
    echo Example: $0 pt-query-digest --version
    echo "Example: $0 pt-query-digest --limit=100% slow_query.log > slow_query.pqd"
    echo WHERE slow_query.log is in the same directory of the script
    echo AND slow_query.pqd will be saved in the same directory of the script
    echo
    exit 1
}

# main
if [ -z $1 ]; then
    help
fi
docker run --rm -ti -v $(pwd):/mnt:ro -w /mnt "$DOCKER_PERCONA_TOOLKIT" "$@"

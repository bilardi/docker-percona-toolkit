#! /bin/bash

# initialization
repository="yuuki0xff/percona-toolkit"

# help
function help {
    echo
    echo Usage: $0 pt-command and arguments
    echo Example: $0 pt-query-digest --version
    echo "Example: $0 pt-query-digest --limit=100% tmp/slow_query.log > slow_query.pqd"
    echo WHERE slow_query.log is in the same directory of the script
    echo AND slow_query.pqd will be saved in the same directory of the script
    echo
    exit 1
}

# main
if [ -z $1 ]; then
    help
fi
if [ -e Dockerfile ]; then
    repository="local-percona-toolkit"
    if [ $(docker images | grep -c $repository) -eq 0 ]; then
        docker build -t $repository .
    fi
else
    echo If you want to use the local Dockerfile, you have to run the script in the same directory of the Dockerfile!
    docker pull $repository
fi
docker run --rm -ti -v $(pwd):/tmp:ro $repository $@

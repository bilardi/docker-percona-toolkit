# percona-toolkit docker image

## Description
You can run all tools included in the percona-toolkit inside a Docker container.
See [Percona toolkit official site](https://www.percona.com/software/mysql-tools/percona-toolkit) for more detail about percona toolkit.

## Usage
```sh
# Install helper script to your computer.
sudo cp -a run.sh /usr/local/bin/docker-pt

# Run pt-* commands inside docker container.
cd /var/log/mysql
docker-pt pt-query-digest slow.log
```

If you want to use the local builded image instead of [yuuki0xff/percona-toolkit](https://hub.docker.com/r/yuuki0xff/percona-toolkit), set docker image name to the `DOCKER_PERCONA_TOOLKIT` environment before execute the `docker-pt` command.
```sh
export DOCKER_PERCONA_TOOLKIT=local-percona-toolkit
```

Alternatively, you can use directly the docker commands.
```sh
docker run --rm -ti -v /var/log/mysql:/mnt:ro -w /mnt yuuki0xff/percona-toolkit pt-query-digest slow.log
```


## Included tools

* pt-align
* pt-archiver
* pt-config-diff
* pt-deadlock-logger
* pt-diskstats
* pt-duplicate-key-checker
* pt-fifo-split
* pt-find
* pt-fingerprint
* pt-fk-error-logger
* pt-heartbeat
* pt-index-usage
* pt-ioprofile
* pt-kill
* pt-mext
* pt-mysql-summary
* pt-online-schema-change
* pt-pmp
* pt-query-digest
* pt-show-grants
* pt-sift
* pt-slave-delay
* pt-slave-find
* pt-slave-restart
* pt-stalk
* pt-summary
* pt-table-checksum
* pt-table-sync
* pt-table-usage
* pt-upgrade
* pt-variable-advisor
* pt-visual-explain

# percona-toolkit docker image

## Description
You can run all tools included in the percona-toolkit inside a Docker container.
See [Percona toolkit official site](https://www.percona.com/software/mysql-tools/percona-toolkit) for more detail about percona toolkit.

## Usage
If you want to use the local Dockerfile, you can run the script in the same directory of the Dockerfile
```sh
bash run.sh pt-query-digest --version
```
or you can use directly the docker commands
```sh
docker build -t local-percona-toolkit .
docker run --rm -ti local-percona-toolkit pt-query-digest --version
```

If you want to use the docker image, you can run the script removing the Dockerfile (*) or
```sh
docker pull yuuki0xff/percona-toolkit
docker run --rm -ti yuuki0xff/percona-toolkit pt-query-digest --version
```
(*) if the script doesn't find the Dockerfile, it pulls the docker image

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

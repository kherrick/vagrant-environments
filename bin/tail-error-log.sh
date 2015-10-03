#!/usr/bin/env bash

#change directory to the project root
bash_source="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
cd "$bash_source" || exit

bin/vm tail -f /var/log/nginx/error.log

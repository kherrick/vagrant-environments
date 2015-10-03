#!/usr/bin/env bash

#change directory to the project root
bash_source="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
cd "$bash_source" || exit

param="$1"

if [ "$1" = "" ]; then
    param="tests"

    echo
    echo "Testing all in tests/"
    echo
fi

vendor/bin/phpunit --bootstrap tests/bootstrap.php "$param"

#!/bin/bash

# Set up tests to run under Travis
set -e
set -x

PERL=`which perl`
run() {
	sudo $PERL -I"SBO-Lib/lib" "$@"
}

run sboconfig -V 14.1
run sbosnap fetch
run sbofind sbotools
[[ 3 -eq yes | run sboinstall -i sbotools ]]
t/do_tests.sh

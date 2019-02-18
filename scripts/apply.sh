#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

set -x

sudo salt-call --local state.apply $@

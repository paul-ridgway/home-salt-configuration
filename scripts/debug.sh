#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

set -x

salt-call --local state.apply -l debug
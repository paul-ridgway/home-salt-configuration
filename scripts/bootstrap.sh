#!/bin/bash
set -e
set -x

curl -L https://bootstrap.saltstack.com -o /tmp/bootstrap_salt.sh         
sudo sh /tmp/bootstrap_salt.sh
rm /tmp/bootstrap_salt.sh

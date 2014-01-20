#!/bin/bash

if [ -z "$1" ]
  then
    echo "Must supply your username: ./publish.sh your_user_name"
	exit 1
fi

if [ ! -f "README.md" ]; then
  echo "This script must be run from the top of the 'bosh-website' repo."
  exit 1
fi

gcf login -a https://api.run.pivotal.io -u $1 -o cfcommunity -s boshorg

RETVAL=$?

[ $RETVAL -eq 0 ] && gcf push bosh-cf-org -i 2 -d cloudfoundry.org -n bosh
[ $RETVAL -ne 0 ] && echo "Login Failure"

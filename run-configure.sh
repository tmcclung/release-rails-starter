#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ ! -d $dir/log ]]; then
  echo "setting up log dir"
  mkdir -p $dir/log
fi

if [[ ! -d $dir/tmp ]]; then
  echo "setting up tmp dir"
  mkdir -p $dir/tmp
fi

echo "running db setup"

bundle exec rake db:exists || bundle exec rake db:create db:structure:load db:migrate

echo "done setting up things and stuff"


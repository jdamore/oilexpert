#! /usr/bin/env bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm rvmrc trust
cd ../oilexpert # hack to load RVMRC
#rvm use 1.9.2
#set -e
gem install bundler --no-rdoc --no-ri
bundle install
if [ -f "results.html" ]; then
    rm results.html
fi
if [ -d "junit" ]; then
    rm -r junit
fi
if [ -d "junit" ]; then
    rm -r screenshots
fi
RAILS_ENV=test
rake test:units
rake test:functionals
exec rails server
cucumber
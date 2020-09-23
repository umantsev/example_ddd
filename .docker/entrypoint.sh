#!/bin/bash

gem update --system
gem install bundler
bundle update --bundler
bundle install

bundle exec rake db:migrate

bundle exec rackup --host 0.0.0.0 config.ru

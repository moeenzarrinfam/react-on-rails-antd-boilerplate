#!/usr/bin/env bash
 
# Prefix `bundle` with `exec` so puma shuts down gracefully on SIGTERM (i.e. `docker stop`)
# exec bundle exec puma --config ./docker/scripts/puma.rb
# bundle exec rails s -p 9292 -b 0.0.0.0
exec bundle exec puma --config ./docker/scripts/puma.rb

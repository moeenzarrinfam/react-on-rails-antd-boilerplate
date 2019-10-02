#!/bin/bash
set -e

# wait for postgres to load completely
sh "$RAILS_ROOT"/docker/scripts/wait-for-postgres.sh

if [[ $@ == 'app' ]]; then
  rake db:create
  rake db:migrate
  exec "$RAILS_ROOT"/docker/scripts/server.sh
# elif [[ $@ == 'sidekiq' ]]; then
  # exec bundle exec sidekiq
fi

exec "$@"
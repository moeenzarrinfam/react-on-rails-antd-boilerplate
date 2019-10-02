FROM ruby:2.5.3-slim

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl git \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && npm install -q -g npm

# Environment Variables
ENV RAILS_ROOT /var/www/react-on-rails
ENV EXPOSE_PORT 8080

# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler

# Finish establishing our Ruby enviornment
RUN bundle install --without development test

# Copy the Rails application into place
COPY . .
COPY config/database.sample.yml config/database.yml
COPY config/secrets.sample.yml config/secrets.yml
COPY config/storage.sample.yml config/storage.yml

EXPOSE $EXPOSE_PORT
RUN apt-get install -y postgresql-client \
    && npm install -g yarn && yarn install && bin/webpack

# Entrypoint is not ignored when Docker container runs with commandline
ENTRYPOINT [ "./docker/scripts/entry.sh" ]

# Health Check
HEALTHCHECK --interval=30s --timeout=5s \
 CMD docker/scripts/healthcheck.sh


# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD "app"




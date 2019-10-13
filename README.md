# README 

* Ruby version: `2.5.3`

* System dependencies: `postgresql + dev`

*  #####*please go to README_DOCKER.md for using docker ( so skip below lines )*

* Configuration:

create configuration files from sample and set values carefully

    cp config/application.sample.yml config/application.yml
    cp config/database.sample.yml config/database.yml
    cp config/cable.sample.yml config/cable.yml
    cp config/storage.sample.yml config/storage.yml

generate `master.key and` `credentials.yml.enc` if you don't know about structure of unencrypted credentials you can use `credentials.sample.yml` but make sure to change values

* Database creation: `rails db:create`

* Database initialization: `rails db:migrate db:seed`

* How to run the test suite: `rspec`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

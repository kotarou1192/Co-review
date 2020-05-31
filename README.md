# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  
  2.7.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## on docker-compose

### build & bundle(only first)

```shell
docker-compose build
```

#### Launch Co-review

```shell
docker-compose up -d web
```

Add these host to hostsfile:

- coreview.coreview 127.0.0.1
- pgadmin.coreview 127.0.0.1

#### watch log

```shell
docker-compose logs -f
```

### ex) Rails operation

#### db migration(development)

```shell
docker-compose run --entrypoint="" --rm app bundle exec rake db:migrate RAILS_ENV=development
docker-compose run --entrypoint="" --rm app bundle exec rake db:migrate:reset RAILS_ENV=development
```

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

## on docker-compose operation

### build & bundle(only first)

```shell
docker-comopse build
docker-compose run --rm ruby bundle install
```

#### watch log

```shell
docker-compose logs -f
```

### ex) Rails operation

#### Launch rails server

```shell
docker-compose up web
```

#### db migration(development)

```shell
docker-compose run --rm ruby bundle exec rake db:migrate RAILS_ENV=development
```

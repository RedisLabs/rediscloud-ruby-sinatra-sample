# Redis Cloud Ruby Sinatra Sample

A Ruby Sinatra sample app that demonstrates [Redis Cloud](http://redis.io) deployment to Heroku.<br />
[SET](http://redis.io/commands/SET) and [GET](http://redis.io/commands/SET) a key, get your db [INFO](http://redis.io/commands/INFO) and [FLUSH](http://redis.io/commands/FLUSHDB) the db.

The app is currently running at: [rediscloud-ruby-sinatra-sample.herokuapp.com](http://rediscloud-ruby-sinatra-sample.herokuapp.com), and uses [Redis Cloud](https://addons.heroku.com/rediscloud) as a backend.

## Deploy to Heroku

Instantly deploy it to Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/RedisLabs/rediscloud-ruby-sinatra-sample)

## Docker

The app can be run and tested using the [Heroku Docker CLI plugin](https://devcenter.heroku.com/articles/introduction-local-development-with-docker).

Make sure the plugin is installed:

    heroku plugins:install heroku-docker

Configure Docker and Docker Compose:

    heroku docker:init

And run the app locally:

    docker-compose up web

The app will now be available on the Docker daemon IP on port 8080.

You can also use Docker to release to Heroku:

    heroku create
    heroku docker:release
    heroku open

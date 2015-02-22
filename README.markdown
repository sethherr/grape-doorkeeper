# Grape-Doorkeeper

#### Create an awesome versioned API, secured with OAuth2 and automatically documented.

This is a basic Rails 4 application with [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper), [Grape](https://github.com/intridea/grape) & [Swagger](http://swagger.io/) for getting to API building quickly.

You can view the [live app](https://grape-doorkeeper.herokuapp.com) and the [Swagger-ui documentation](https://grape-doorkeeper.herokuapp.com/documentation). 

This app is ready to deploy to Heroku [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/sethherr/grape-doorkeeper)


## Set up

First `bundle install` and `rake db:setup`

Run `rake start` to get the server running locally. It runs at [http://localhost:3001](http://localhost:3001)

You will want to change [config/initializers/secret_token.rb](config/initializers/secret_token.rb) and export `DEVISE_SECRET_KEY` (see config/initializers/devise.rb).

This app includes [omniauth-bike-index](https://github.com/bikeindex/omniauth-bike-index). For Bike Index login to work, export environment variables `BIKEINDEX_APP_ID` and `BIKEINDEX_APP_SECRET`. You'll need a Bike Index app, which you can create at [BikeIndex.org/oauth/applications/new](https://BikeIndex.org/oauth/applications/new).

*Bike Index uses a similar grape, Swagger, doorkeeper setup&mdash;this is an example of [creating an OmniAuth strategy for doorkeeper](https://github.com/doorkeeper-gem/doorkeeper/wiki/Create-a-OmniAuth-strategy-for-your-provider)*.


## Notes

Grape is mounted in [app/controllers/api](app/controllers/api), as described in the excellent [Introduction to building APIs with Grape](http://codetunes.com/2014/introduction-to-building-apis-with-grape/) by Monterail.

There are are more posts in the series which are worth reading, particularly [OAuth Implicit Grant with Grape, Doorkeeper and AngularJS](http://codetunes.com/2014/oauth-implicit-grant-with-grape-doorkeeper-and-angularjs/).

There is also a [Railscast on doorkeeper](http://railscasts.com/episodes/353-oauth-with-doorkeeper)

Important things in the Gemfile:

- [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) (OAuth providing)
- [grape](https://github.com/intridea/grape) (API building)
- [wine_bouncer](https://github.com/antek-drzewiecki/wine_bouncer) (Doorkeeper and Grape)
- [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger) (automatically generates Swagger docs for the [auto documentation](https://grape-doorkeeper.herokuapp.com/documentation))
- [Devise](https://github.com/plataformatec/devise) (users)


Also important, but maybe not as necessary to know about:

- [rails_swagger-ui](https://github.com/d4be4st/swagger-ui_rails) (how we get swagger-ui)
- [Puma](http://puma.io/) (the web server)
- [api-pagination](https://github.com/davidcelis/api-pagination)
- [grape-active_model_serializers](https://github.com/jrhe/grape-active_model_serializers) 
- [CORS](https://github.com/cyu/rack-cors)
- [foreman](https://github.com/ddollar/foreman) (in development to manage processes)
- [Haml](http://haml.info/)
- [dotenv-rails](https://github.com/bkeepers/dotenv) (load environmental variables - .env is in .gitignore, so it isn't committed)
- [Bootstrap](http://getbootstrap.com/)
- Postgres

----

If you want to change the name of the app, swap out:

- `GrapeDoorkeeper` in [config/application.rb](config/application.rb)
- `grape-doorkeeper` in [config/database.yml](config/database.yml) (multiple instances)
- `grape-doorkeeper` in [config/initializers/session_store.rb](config/initializers/session_store.rb)


## Testing

Rspec and guard - run `bundle exec guard` to watch your spec files for changes and rerun tests for those files.

There is a spec for the `api/v1/me` API route and for the swagger docs to help get you started.
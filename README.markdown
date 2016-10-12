# Grape-Doorkeeper

#### Create an awesome versioned API, secured with OAuth2 and automatically documented.

This is a basic Rails 4 application with [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper), [Grape](https://github.com/intridea/grape) & [Swagger](http://swagger.io/) for getting to API building quickly.

You can view the [live app](https://grape-doorkeeper.herokuapp.com) and the [Swagger-ui documentation](https://grape-doorkeeper.herokuapp.com/documentation). 

This app is ready to deploy to Heroku [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/sethherr/grape-doorkeeper)


## Set up

- Set up the rails app and database with `bundle install` and `rake db:setup`

- Run `./start` to get the server running locally. It runs at [http://localhost:3003](http://localhost:3003)

- Copy [.env.sample](/.env.sample) to `.env` and replace the values with your own values.

- Delete the [imaginary item](app/models/imaginary_item.rb) class and [serializer](app/serializers/item_serializer.rb), which are included for demonstration in [the me/items endpoint](app/controllers/api/v1/me.rb#L24-L33).

This app includes [omniauth-bike-index](https://github.com/bikeindex/omniauth-bike-index). For Bike Index login to work, create a Bike Index app at [BikeIndex.org/oauth/applications/new](https://BikeIndex.org/oauth/applications/new) and add the values from `BIKEINDEX_APP_ID` and `BIKEINDEX_APP_SECRET` to the `.env` file.

*Bike Index uses a similar grape, Swagger, doorkeeper setup&mdash;this is an example of [creating an OmniAuth strategy for doorkeeper](https://github.com/doorkeeper-gem/doorkeeper/wiki/Create-a-OmniAuth-strategy-for-your-provider)*.


## Adding to an existing application

[View how to on the wiki](https://github.com/sethherr/grape-doorkeeper/wiki/Adding-to-an-existing-application).


## Notes

Grape is mounted in [app/controllers/api](app/controllers/api), as described in the excellent [Introduction to building APIs with Grape](http://codetunes.com/2014/introduction-to-building-apis-with-grape/) by Monterail, and [part 2](http://codetunes.com/2014/grape-part-II/) of the series.

There are are other posts in the series which are worth reading, particularly [OAuth Implicit Grant with Grape, Doorkeeper and AngularJS](http://codetunes.com/2014/oauth-implicit-grant-with-grape-doorkeeper-and-angularjs/).

There is also a [Railscast on doorkeeper](http://railscasts.com/episodes/353-oauth-with-doorkeeper).

Important things in the Gemfile:

- [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) (OAuth providing)
- [grape](https://github.com/intridea/grape) (API building)
- [wine_bouncer](https://github.com/antek-drzewiecki/wine_bouncer) (Doorkeeper and Grape)
- [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger) (automatically generates Swagger docs for the [auto documentation](https://grape-doorkeeper.herokuapp.com/documentation))
- [Devise](https://github.com/plataformatec/devise) (users)


Also important, but maybe not as necessary to know about:

- [rails-assets](https://rails-assets.org) manages the js for swagger-ui
- [Puma](http://puma.io/) (the web server)
- [api-pagination](https://github.com/davidcelis/api-pagination)
- [grape-active_model_serializers](https://github.com/jrhe/grape-active_model_serializers) 
- [CORS](https://github.com/cyu/rack-cors)
- [foreman](https://github.com/ddollar/foreman) (in development to manage processes)
- [Haml](http://haml.info/) - and [Hamlit](https://github.com/k0kubun/hamlit), which is faster haml
- [dotenv-rails](https://github.com/bkeepers/dotenv) (load environmental variables - .env is in .gitignore, so it isn't committed)
- [Bootstrap](http://getbootstrap.com/)
- Postgres

----

If you want to change the name of the app, swap out:

- `GrapeDoorkeeper` in [config/application.rb](config/application.rb)
- `grape-doorkeeper` in [config/database.yml](config/database.yml) (multiple instances)
- `grape-doorkeeper` in [config/initializers/session_store.rb](config/initializers/session_store.rb)
- Do a project wide search of `/grape.doorkeeper/i` to catch any lingering ones like [api_v1.html.haml](app/views/documentation/api_v1.html.haml)


## Testing

Rspec and guard - run `bundle exec guard` to watch your spec files for changes and rerun tests for those files.

There is a spec for the `api/v1/me` API route and for the swagger docs to help get you started.
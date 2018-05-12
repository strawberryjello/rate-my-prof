# Rate My Prof

A simple Rails 5 app for rating professors.

## Requirements

**Ruby 2.3.5**

Install Ruby 2.3.5 using a version manager such as [rbenv](https://github.com/rbenv/rbenv) or [RVM](https://rvm.io/) if you don't already have it.

**Bundler**

Install [Bundler](https://bundler.io/):
```
gem install bundler
```

Make sure to set the Ruby version to 2.3.5 before installing; eg, in rbenv you can set this in the shell by running `rbenv shell 2.3.5` before running the Bundler installation.

**SQLite**

This app currently uses an SQLite3 database; in case your platform doesn't have SQLite installed, you can download it from [the SQLite website](http://www.sqlite.org/index.html).

You can check if you have it installed by running `sqlite3` in the shell, which invokes the CLI.

## Running the App

- Clone or download this repo
- `cd` into the top-level directory (after unzipping the archive if applicable)
- Run `bundle install` to fetch the dependencies
  - You may have to uncomment the line containing `gem 'mini-racer'` in the Gemfile depending on your platform; this gem enables the running of JavaScript from the app. See the [ExecJS readme](https://github.com/rails/execjs#readme) for more details.
- Run `bin/rails db:migrate RAILS_ENV=development` to set up the database
- Run the app using `bin/rails server` (or `bin/rails s` for short)

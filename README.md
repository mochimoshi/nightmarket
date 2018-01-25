# Stanford Night Market

![alt text](https://circleci.com/gh/mochimoshi/nightmarket.svg?style=shield&circle-token=:circle-token "Test status")

Hello! Food is delicious, but sometimes you need some code to go with that food. So now what? This is the code for stanfordnightmarket.org - or rather, a refactor of it to clean up some fun hacks to make things work.

## Getting Set Up

Stanford Night Market runs on Ruby on Rails. We're using **ruby v2.3.3** and **rails 5.0.0.1**, and using **postgresql** for the backing database. Let's assume you're starting on MacOS (and people on Windows would have a similar setup - just find the corresponding steps and everything should be A-OK!).

**Clone this repo somewhere safe**

Pretty straightforward. This is your local development copy!

**Get Homebrew**

That's at [brew.sh](http://brew.sh/) - you may need to get XCode installed as well for additional components. We will use this to get a lot of the packages you may need.

**Install PostgreSQL**

`brew install postgresql`

Start the server with this command: `pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`

This needs to be done before you start your test rails server.

Stop the server with this command: `pg_ctl -D /usr/local/var/postgres stop -s -m fast`

**Get rbenv (and ruby)**

See installation instructions for [rbenv](https://github.com/rbenv/rbenv). Make sure you get ruby 2.3.3!

**Get bundler**

With [bundler](http://bundler.io/), you will be able to manage your ruby dependencies. Generally `gem install bundler` will get you going soon enough.

**Install rails**

`gem install rails`. Cool beans.

Now, go into the project directory and also run `bundle install`. (You may need to run "ARCHFLAGS='-arch x86_64' bundle install")


You will need to set up Ruby environmental variables for Google Signin. You can create an app at the [Google Development Console](https://console.developers.google.com).

When that is all done, create your test databases with `rake db:create` and "rake db:migrate", create assets with `rake assets:precompile` and then run `rails server` to access your site on [localhost:3000](http://localhost:3000). You did it!
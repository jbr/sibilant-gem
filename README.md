[![Build Status](https://travis-ci.org/jbr/sibilant-gem.png?branch=master)](https://travis-ci.org/jbr/sibilant-gem)
[![Coverage Status](https://coveralls.io/repos/jbr/sibilant-gem/badge.png)](https://coveralls.io/r/jbr/sibilant-gem)

# Sibilant Ruby Gem

This is a ruby wrapper for the sibilant compiler, which is written in
javascript. It expects to find NodeJS available on the path as node.
Sibilant doesn't need to be installed.

# Tilt support

[Tilt](https://github.com/rtomayko/tilt/) support is provided by `sibilant/tilt`:

    require 'sibilant/tilt'
    Tilt['test.sibilant'].new { "(+ 1 2 3)" }.render #=> '(1 + 2 + 3)'

# Sinatra

[Sinatra](http://sinatrarb.com) support is provided by `sibilant/sinatra`:

    require 'sinatra'
    require 'sibilant/sinatra'
    helpers Sinatra::Sibilant
    get('/inline.js') { sibilant "(alert 'here)" }

    #./views/templated.sibilant
    get('/templated.js') { sibilant :templated }

## How to install

First, you'll need [NodeJS](http://nodejs.org/) installed.

Add this line to your application's Gemfile:

    gem 'sibilant'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sibilant

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

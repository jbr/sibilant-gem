[![Build Status](https://travis-ci.org/jbr/sibilant-gem.png?branch=master)](https://travis-ci.org/jbr/sibilant-gem)
[![Coverage Status](https://coveralls.io/repos/jbr/sibilant-gem/badge.png)](https://coveralls.io/r/jbr/sibilant-gem)

# Sibilant Ruby Gem

This is a ruby wrapper for the sibilant compiler, which is written in
javascript.  Instead of depending on ExecJS, it expects to find NodeJS
available on the path as node.  Sibilant doesn't need to be installed.

# Tilt support

Providing sibilant code inside of a [tilt](https://github.com/rtomayko/tilt/) environment is provided by

    require 'sibilant/tilt'
    Tilt['test.sibilant'].new { "(+ 1 2 3)" }.render #=> '(1 + 2 + 3)'

# Sinatra

    require 'sinatra'
    require 'sibilant/sinatra'
    helpers Sinatra::Sibilant
    get('/inline.js') { sibilant "(alert 'here)" }

    #./views/templated.sibilant
    get('/templated.js') { sibilant :templated }

## When it's ready, here's how you'll install it

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

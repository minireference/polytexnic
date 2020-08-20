# polytexnic

This is the `polytexnic` gem, which converts input in Markdown or PolyTeX to HTML and LaTeX. It currently has no standalone applications, but rather exists to support the `softcover` gem.

## Installation

This gem is installed automatically as a dependency of the `softcover` gem:

    $ gem install polytexnic

## Usage

See [*The Softcover Book*](http://manual.softcover.io/book) for more information.


## Development

### Need to have python2.7 as the default

    virtualenv -p python2.7 venv
    source venv/bin/activate

### Install

    rvm use ruby-2.6.3
    gem install bundler
    bundle install
    bundle exec rake install

### Run tests

    rspec spec


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
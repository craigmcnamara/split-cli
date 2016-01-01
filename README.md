# Split::Cli

Add a CLI so Split can be used in unfamiliar situations and bad circumstances. I'm looking at you PHP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'split-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install split-cli

## Usage

Supported Options
```shell
REDIS_URL              # default 'localhost:6379'
SPLIT_YAML_CONFIG      # required
SPLIT_MULTI_EXPERIMENT # default true
REDIS_NAMESPACE        # optional
```

```shell
$ split-cli
Usage: split-cli [ab_test|finished] session_id experiment_name
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/craigmcnamara/split-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

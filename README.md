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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/craigmcnamara/split-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


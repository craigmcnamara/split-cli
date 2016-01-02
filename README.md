# Split::Cli

[![Build Status](https://travis-ci.org/craigmcnamara/split-cli.svg)](https://travis-ci.org/craigmcnamara/split-cli)

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

Supported environment variables
```shell
SPLIT_YAML_CONFIG      # required 'path/to.yml'
REDIS_URL              # default 'localhost:6379'
SPLIT_MULTI_EXPERIMENT # default true
REDIS_NAMESPACE        # default 'split'
```

Basic Usage

```shell
$ split-cli
Usage: split-cli [ab_test|finished] session_id experiment_name
    -c, --config [path]              Path to Split YAML config
    -m, --multi                      Participate in multiple experiments. Default: true
    -r, --redis [url]                Redis URL
    -n, --namespace [namespace]      Redis namespace

$ split-cli ab_test session_id experiment_name
variant_x # ab_test command returns the string of the variant chosen

$ split-cli finished session_id experiment_name # no output and zero return is success
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/craigmcnamara/split-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/craigmcnamara/split-cli/blob/master/CODE_OF_CONDUCT.md) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


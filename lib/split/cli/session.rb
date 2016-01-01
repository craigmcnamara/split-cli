require 'yaml'

module Split
  module Cli
    class Session
      include Split::Helper

      attr_accessor :session_id, :options

      CONFIG_ERROR_MESSAGE = 'Set SPLIT_YAML_CONFIG to a valid path.'.freeze

      def initialize(session_id, options = {})
        @session_id = session_id
        @options = options
        config_split!
      end

      def ab_test(*args)
        raise(Split::Cli::CommandError, 'No experiment name provided') unless args.any?
        super
      end

      def finished(*args)
        raise(Split::Cli::CommandError, 'No experiment name provided') unless args.any?
        super
      end

      private

      def config_split!
        Split.redis = options.fetch :redis_url, ENV.fetch('REDIS_URL', 'localhost:6379')
        Split.redis.namespace = options.fetch :redis_namespace, ENV['REDIS_NAMESPACE']

        Split.configure do |config|
          config.persistence = Split::Persistence::RedisAdapter.with_config(lookup_by: -> (cli) { cli.session_id })
          config.allow_multiple_experiments = options.fetch(:allow_multiple_experiments, ENV.fetch('SPLIT_MULTI_EXPERIMENT', true))
          config.experiments = YAML.load_file yaml_config_path
        end
      end

      def yaml_config_path
        options.fetch(:config_path, ENV['SPLIT_YAML_CONFIG']) || raise(CommandError, CONFIG_ERROR_MESSAGE)
      end

    end
  end
end

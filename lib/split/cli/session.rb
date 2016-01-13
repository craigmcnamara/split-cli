require 'yaml'

module Split
  module Cli
    class Session
      include Split::Helper

      attr_accessor :session_id, :request, :options

      CONFIG_ERROR_MESSAGE = 'Set SPLIT_YAML_CONFIG to a valid path.'.freeze

      def initialize(session_id, options = {})
        @session_id = session_id
        @options = options
        @request = Request.new(options.fetch(:user_agent, 'CLI'))
        config_split!
      end

      def ab_test(*args)
        raise_unless_valid_args!(args)
        super
      end

      def finished(*args)
        raise_unless_valid_args!(args)
        super
      end

      public :is_robot?

      private

      def raise_unless_valid_args!(args)
        raise(Split::Cli::CommandError, 'No experiment name provided') unless args.any?
      end

      def config_split!
        Split.redis = options.fetch :redis_url, ENV.fetch('REDIS_URL', 'localhost:6379')
        Split.redis.namespace = options.fetch :redis_namespace, ENV.fetch('REDIS_NAMESPACE', 'split')

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

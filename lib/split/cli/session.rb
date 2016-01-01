require 'yaml'

module Split
  module Cli
    class Session
      include Split::Helper

      attr_accessor :session_id

      CONFIG_ERROR_MESSAGE = 'Set SPLIT_YAML_CONFIG to a valid path.'.freeze

      def initialize(session_id)
        @session_id = session_id
        config_split!
      end

      public :ab_test
      public :finished

      private

      def config_split!
        Split.redis = ENV.fetch('REDIS_URL', 'localhost:6379')

        Split.redis.namespace = ENV['REDIS_NAMESPACE']

        Split.configure do |config|
          config.persistence = Split::Persistence::RedisAdapter.with_config(lookup_by: -> (cli) { cli.session_id })
          config.allow_multiple_experiments = ENV.fetch('SPLIT_MULTI_EXPERIMENT', true)
          config.experiments = YAML.load_file yaml_config_path
        end
      end

      def yaml_config_path
        ENV['SPLIT_YAML_CONFIG'] || raise(CommandError, CONFIG_ERROR_MESSAGE)
      end

    end
  end
end

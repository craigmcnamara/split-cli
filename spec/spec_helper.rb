$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'split/cli'

spec_root = Pathname.new(File.dirname(File.expand_path(__FILE__)))

ENV['SPLIT_YAML_CONFIG'] = (spec_root + 'fixtures' + 'config.yml').to_s

Split.redis = ENV.fetch('REDIS_URL', 'localhost:6379')
Split.redis.namespace = ENV['REDIS_NAMESPACE']

RSpec.configure do |config|
  config.order = 'random'
  config.before(:each) { Split.redis.flushall }
end
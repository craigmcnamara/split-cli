require 'benchmark/ips'
require 'securerandom'

SecureRandom.hex

Benchmark.ips do |x|
  x.report("split-cli") { `bin/split-cli ab_test #{SecureRandom.hex} my_first_experiment` }
end

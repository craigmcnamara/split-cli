require 'spec_helper'

describe Split::Cli::Session do

  let(:session_id) { 'session_id' }
  let(:cli){ Split::Cli::Session.new(session_id) }

  it 'returns consistently for the same session' do
    5.times.map { cli.ab_test('my_first_experiment') }.each do |invocation|
      expect(invocation).to eq(cli.ab_test('my_first_experiment'))
    end    
  end

  describe 'conversion' do
    let!(:alternative) { cli.ab_test('my_first_experiment') }

    it 'can finish an experiment' do
      cli.finished('my_first_experiment')
    end
  end

  describe 'many sessions' do
    let!(:ab_users) { 5.times.map(&:to_s) }
    let!(:ab_sessions) { ab_users.map { |session_id| Split::Cli::Session.new(session_id) } }

    it 'properly conducts an experiment' do
      test_variants = ab_sessions.map { |cli| cli.ab_test('my_first_experiment') }
      completed = ab_sessions.map { |cli| cli.finished('my_first_experiment') }.flatten
      experiment = completed.first
      expect(experiment.alternatives.map(&:completed_count).inject(:+)).to eq(completed.count)
    end

  end
end

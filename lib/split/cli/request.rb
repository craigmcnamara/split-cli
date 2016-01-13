module Split
  module Cli
    class Request
      attr_accessor :user_agent, :ip

      def initialize(user_agent)
        @user_agent = user_agent
      end

    end
  end
end

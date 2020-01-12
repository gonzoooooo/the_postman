require "the_postman/version"

module ThePostman
  class Error < StandardError; end

  class Postman
    def initialize(args)
    end

    def post(message)
    end
  end
end

require "the_postman/slack_postman"

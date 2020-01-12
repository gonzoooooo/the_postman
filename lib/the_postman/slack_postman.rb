require "json"
require "net/http"

module ThePostman
  class WebHookNotFoundError < StandardError; end

  class SlackPostman < Postman
    def initialize(channel:, username:, icon_emoji: nil)
      super
      @channel = channel
      @username = username
      @icon_emoji = icon_emoji
    end

    def post(message)
      raise WebHookNotFoundError if webhook_url.nil?

      postdata = {
        "channel" => @channel,
        "username" => @username,
        "text" => message,
      }
      postdata["icon_emoji"] = @icon_emoji unless @icon_emoji.nil?

      uri = ::URI.parse(webhook_url)

      https = ::Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      req = ::Net::HTTP::Post.new(uri.request_uri)
      req.body = postdata.to_json
      req["Content-Type"] = "application/json"

      https.request(req)
    end

    def webhook_url
      @webhook_url ||= ENV["SLACK_WEBHOOK_URL"]
    end
  end
end

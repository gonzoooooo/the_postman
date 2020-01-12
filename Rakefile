require "bundler/gem_tasks"
require "the_postman"

task :slack, ["channel", "username", "icon_emoji", "message"] do |task, args|
  postman = ThePostman::SlackPostman.new(channel: args.channel, username: args.username, icon_emoji: args.icon_emoji)
  postman.post(args.message)
end

task :default => :spec

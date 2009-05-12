require 'rubygems'
require 'integrity'
require 'twitter'

module Integrity
  class Notifier
    class IntegrityTwitter < Notifier::Base
      
      def self.to_haml
        File.read File.dirname(__FILE__) / "config.haml"
      end

      def deliver!
        @tweet = Twitter::Base.new(Twitter::HTTPAuth.new(@config["email"], @config["pass"]))
        @tweet.update("#{build.project.name}: #{short_message}")
      end
      
    end
  end
end

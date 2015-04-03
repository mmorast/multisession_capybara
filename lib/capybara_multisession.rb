require "capybara_multisession/version"
require 'capybara_multisession/session_manger'
require 'capybara'

module CapybaraMultisession
  class << self
    attr_accessor :session_initializer, :session_manager

    def configure
      yield self
    end

  end

  CapybaraMultisession.configure do |config|
    config.session_manager = CapybaraMultisession::SessionManger.new(Capybara.current_session)
    config.session_initializer = nil #Nil value will disable the running of initialize block on new session
  end
end

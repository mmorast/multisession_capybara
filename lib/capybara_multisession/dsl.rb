module CapybaraMultisession
  module DSL
    def run_as(session_name=:default)
      if session_exists?(session_name)
        #Capybara.using_session(session_name) do block.call end
        Capybara.session_name = session_name
        yield if block_given?
      else
        CapybaraMultisession.add_session(session_name,
                                                 Capybara::Session.new(Capybara.current_driver, Capybara.app))
        #Capybara.using_session(session_name) do block.call end
        Capybara.session_name = session_name
        yield if block_given?
      end
    ensure
      Capybara.session_name = :default
    end

    def session_exists?(session_name)
      CapybaraMultisession.session_manager.exists?(session_name)
    end
  end
end
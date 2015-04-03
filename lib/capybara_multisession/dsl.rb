module CapybaraMultisession
  module DSL
    def run_as(session_name=:default, &block)
      if session_exists?(session_name)
        using_session(session_name) do block.call end
      else
        CapybaraMultisession.session_manager.add(session_name,
                                                 Capybara::Session.new(Capybara.current_driver, Capybara.app))
        Capybara.using_session(session_name) do block.call end
      end

    end

    def session_exists?(session_name)
      CapybaraMultisession.session_manager.exists?(session_name)
    end
  end
end
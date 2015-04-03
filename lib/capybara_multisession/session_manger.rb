module CapybaraMultisession
  class SessionManger

    def initialize(default_session = nil)
      @sessions           = {}
      @sessions[:default] = default_session
    end

    def add(session_name, session)
      @sessions[session_name] = session
      Capybara.instance_variable_set("@session_pool",
                                     { session_name => @sessions[session_name] })
    end

    def delete(session_name)
      @sessions.delete(session_name)
    end

    def session(session_name)
      @sessions[session_name]
    end

    def default_session
      @sessions[:default]
    end

    def sessions
      @sessions.keys
    end

    def exists?(session_name)
      @sessions.key?(session_name)
    end


  end
end
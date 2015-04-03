require 'minitest_helper'
require 'capybara_multisession'


class SessionManagerTest < Minitest::Test

  def setup
    @session_manager = CapybaraMultisession::SessionManger.new
  end



  def teardown
    # Do nothing
  end


  def test_default_session_nil_if_none_passed
     assert_nil(@session_manager.session(:default), "SessionManager initialize without parameters did not result in nil session: got #{@session_manager.session(:default)}")
  end

  def test_set_and_retrieve_default_if_session_passed_to_new
    my_default_session = Capybara::Session.new(Capybara.current_driver, Capybara.app)
    @session_manager = CapybaraMultisession::SessionManger.new(my_default_session)
    assert_equal(my_default_session, @session_manager.session(:default), "SessionManager initialize with session did not use session: got #{@session_manager.session(:default)}")
  end

  def test_list_of_session_names_can_be_retrieved
    assert_equal([:default], @session_manager.sessions, "Expected session list [:default], received #{@session_manager.sessions}")
  end

  def test_can_add_a_new_session_to_session_manager
    new_session = Capybara::Session.new(Capybara.current_driver, Capybara.app)
    @session_manager.add(:first_session, new_session)
    assert_equal(new_session, @session_manager.session(:first_session), "The session did not store in manager. Expected: #{new_session}, Actual: #{@session_manager.session(:first_session)}")
  end

  def test_can_delete_a_session_in_session_manager
    new_session = Capybara::Session.new(Capybara.current_driver, Capybara.app)
    @session_manager.add(:first_session, new_session)
    @session_manager.delete(:first_session)
    assert_nil(@session_manager.session(:first_session), "The session did not delete in manager. #{@session_manager.session(:first_session)}")
  end

  def test_can_call_delete_when_session_does_not_exist
    delete_result=@session_manager.delete(:non_existing_session)
    assert_nil(delete_result, "Session delete did not return nil as expected")
  end
end
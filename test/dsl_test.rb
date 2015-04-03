require 'minitest_helper'
require 'capybara_multisession'
require 'capybara_multisession/dsl'

class DslTest < Minitest::Test
  include CapybaraMultisession::DSL

  def setup
    CapybaraMultisession.configure do |config|
      config.session_initializer = lambda
    end
  end

  def teardown
    # Do nothing
  end

  # Fake test
  def test_code_run
    run_as("monte") do
      assert(true)
    end

  end
end
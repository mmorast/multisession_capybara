require 'minitest_helper'
require 'capybara_multisession'
require 'capybara_multisession/dsl'


class DslTest < Minitest::Test
  include CapybaraMultisession::DSL

  def setup
    CapybaraMultisession.configure do |config|

    end
  end

  def teardown
    # Do nothing
  end

  # Fake test
  def test_code_run
    run_as("monte") do
      visit('/nav_test')
      assert_equal('Confirmed navigation', page.text, "Expected 'Confirmed navigation', Actual: #{page.text}")
    end

  end
end
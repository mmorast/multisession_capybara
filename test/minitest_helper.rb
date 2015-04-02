$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'capybara_multisession'

require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'

Minitest::Reporters.use!  [Minitest::Reporters::ProgressReporter.new, Minitest::Reporters::RubyMineReporter.new ]
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
ENV['RACK_ENV'] = 'test'

require 'capybara_multisession'
require_relative './lib/multisession_rackapp.rb'

gem "minitest"
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'

#require 'capybara'
require 'capybara/dsl'
require 'rack/test'

#Setup minitest reporters.
Minitest::Reporters.use!  [Minitest::Reporters::ProgressReporter.new, Minitest::Reporters::RubyMineReporter.new ]

#Setup Capyara to use
Capybara.app = MultisessionRackapp

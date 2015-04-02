require "bundler/gem_tasks"
require "rake/testtask"

task :default => :test
Rake::TestTask.new(:test) do |task|
  task.libs = %w(lib test)
  task.pattern = 'test/**/*_test.rb'
end

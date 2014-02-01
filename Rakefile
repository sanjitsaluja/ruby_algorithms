require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'ruby_algorithms' # You know what to do.
  ARGV.clear
  IRB.start
end

task :default => :test

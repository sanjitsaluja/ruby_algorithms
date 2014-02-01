require "ruby_algorithms/version"

module RubyAlgorithms
  Dir["#{File.dirname(__FILE__)}/ruby_algorithms/**/*.rb"].each { |f| load(f) }
end

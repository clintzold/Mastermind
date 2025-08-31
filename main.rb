require 'pry-byebug'
require_relative 'lib/gameplay'
require_relative 'lib/players'
include Gameplay

maker = Players.make_maker
breaker = Players.make_breaker
binding.pry
puts 'bye'

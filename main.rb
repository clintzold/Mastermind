require 'pry-byebug'
require_relative 'lib/gameplay'
require_relative 'lib/players'
include Gameplay

maker = Players.new()
maker.name = "Code-Master"
breaker = Players.new()
breaker.name = "Code-Breaker"

maker.enter_code
code = maker.code

#Main gameplay cycle
loop do
  turns = 0

  #Code breaker guessing cycle
  while turns < 5 do
    breaker.enter_code
    guess = breaker.code
    break if eql?(code, guess)
    color_match(code, guess)
    exact_match(code, guess)
    turns += 1
  end
  
  puts "Code-Breaker wins with code: #{code}" if turns == 5

  print "Play again? (Y) or (N)"
  answer = gets.chomp.upcase
  break if !check_play_again(answer)
  
  #Lets Code-Maker enter a new code for next round of play
  maker.enter_code

end
binding.pry
puts 'Goodbye!'

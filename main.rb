require 'pry-byebug'
require 'io/console'
require_relative 'lib/gameplay'
require_relative 'lib/players'
include Gameplay

maker = Players.new()
maker.name = "Code-Master"
breaker = Players.new()
breaker.name = "Code-Breaker"

print "
**************************************************************************************
*███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗ *
*████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗*
*██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║*
*██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║*
*██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝*
*╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ *
**************************************************************************************
"
#Main gameplay cycle
loop do

  #Tracks guesses and sets maker code until a winner is determined
  guesses = 0
  maker.enter_code
  code = maker.code

  #Code breaker guessing cycle
  while guesses < 5 do
    breaker.enter_code
    guess = breaker.code
    break if eql?(code, guess)
    color_match(code, guess)
    exact_match(code, guess)
    guesses += 1
  end
  
  puts "\nCode-Maker wins with code: #{code}" if guesses == 5

  print "\nPlay again? (Y) or (N): "
  answer = gets.chomp.upcase
  break if !check_play_again(answer)
  
end
puts "\n\nGoodbye!"

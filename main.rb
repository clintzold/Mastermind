require 'pry-byebug'
require 'io/console'
require_relative 'lib/gameplay'
require_relative 'lib/players'
require_relative 'lib/computers'
include Gameplay


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
game_choice = (play_choice)
if game_choice == 1
  maker = Computers.new()
  breaker = Players.new()
elsif game_choice == 2
  maker = Players.new()
  breaker = Computers.new()
else
  maker = Players.new()
  breaker = Players.new()
end

maker.name = "Code-Master"
breaker.name = "Code-Breaker"

#Main gameplay cycle
loop do

  #Tracks guesses and sets maker code until a winner is determined
  guesses = 0
  #Counter that Stops AI from inevitably calculating exact code
  adjustments = 0
  maker.enter_code
  code = maker.code

  #Code breaker guessing cycle
  while guesses < 5 do
    breaker.enter_code
    guess = breaker.code
    break if eql?(code, guess)
    color_match(code, guess)
    if game_choice == 2
      if adjustments < 2
        breaker.adjust_options(exact_match(code, guess))
      else
        exact_match(code, guess)
      end
      adjustments += 1
      puts "Press a key for AI to make next guess..."
      gets
    else
      exact_match(code, guess)
    end
    guesses += 1
  end
  
  breaker.reset_options if game_choice == 2#Repopulate AI @options for next round of play
  puts "\nCode-Maker wins with code: #{code}" if guesses == 5
  print "\nPlay again? (Y) or (N): "
  answer = gets.chomp.upcase
  break if !check_play_again(answer)
  
end
puts "\n\nGoodbye!"

module Gameplay

  def play_choice

    options = [1, 2, 3]
    puts "\nWelcome to MASTERMIND. Select a play option...\n(1) Code-Master = AI, Code-Maker = Player\n(2) Code-Master = Player, Code-Break = AI\n(3) Code-Master = Player, Code-Breaker = Player\n"
    loop do
      choice = gets.chomp.to_i
      if options.any? {|num| num == choice}
        return choice
      else
        puts "Invalid. Please choose (1), (2), or (3)"
      end
    end
    
  end
  #Checks for colors matching in exact locations and returns their amount
  def exact_match(code, guess)

    matches = [nil, nil, nil, nil]
    code.each_with_index do |item_one, index_one|
      guess.each_with_index do |item_two, index_two|
        if item_one == item_two && index_one == index_two
          matches[index_one] = item_one
        end
      end
    end
    num_of_matches = [] 
    matches.each {|item| num_of_matches << item if item != nil}
    if num_of_matches.length > 0
      puts "#{num_of_matches.length} exact matches!"
    else
      puts "No matches found"
    end
    return matches
    
  end

  #Checks for a winning code and breaks guessing cycle if true
  def eql?(code, guess)

    if code == guess
      puts "\nCode was broken!\n #{code}"
      return true
    else 
      return false
    end

  end

  #Checks and displays how many colors were accurately guessed but in wrong positions
  def color_match(code, guess)
    
    matches = []
    guess.each do |guess_item|
      if code.any? {|code_item| code_item == guess_item}
        matches << guess_item
      end
    end
    colors_included = matches.uniq.length
    if colors_included > 0
      print "\n#{colors_included} colors are correct. "
    else
      print "\nNo colors are correct. "
    end

  end

  #Continues gameplay cycle if true, exits if false
  def check_play_again(answer)
    
     loop do
      if answer == 'Y'
        return true
      elsif answer == 'N'
        return false
      else
        puts "\nInvalid input. Play again? (Y) or (N)..."
        answer = gets.chomp.upcase
      end
    end 

  end

end

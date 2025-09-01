require 'pry-byebug'
class Computers
  #include Gameplay
  attr_accessor :code, :name, :options

  def initialize
    @code = []
    @name = ''
    @options = 
        [ ['red', 'blue', 'green', 'pink'], ['red', 'blue', 'green', 'pink'], 
         ['red', 'blue', 'green', 'pink'], ['red', 'blue', 'green', 'pink'] ]
  end

  #Adjusts random selection to match changing option sizes as Computer calculates guesses
  def enter_code

    code = []
    self.options.each do |item|
      num = item.length
        choice = rand(num)
        code << item[choice]
    end
    self.code = code

  end

  #Narrows option pool based on past guesses and hints(receives array of matches from exact_match method in Gameplay module
  def adjust_options(matches)

    matches.each_with_index do |item, index|
      if item != nil
        self.options[index] = [item]
      else
        self.options[index].delete(code[index])
      end
    end
    
  end

end

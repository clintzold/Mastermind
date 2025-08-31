class Players
  include Gameplay
  attr_accessor :code

  def initialize(code)
    @code = code
  end

  def self.make_maker
    code = []
    options = ['red', 'blue', 'green', 'pink']
    puts "Code-Master, please enter four colors(options: red, blue, green, pink): "
    while code.length < 4 do
      color = gets.chomp.downcase
      if options.any? {|option| option == color}
        code << color
      else
        puts "Invalid choice! Options: red, blue, green, pink"
      end
    end
    Players.new(code)
  end


  def self.make_breaker 
    guess = []
    options = ['red', 'blue', 'green', 'pink']
    puts "Code-Breaker, please enter four colors(options: red, blue, green, pink): "
    while guess.length < 4 do
      color = gets.chomp.downcase
      if options.any? {|option| option == color}
        guess << color 
      else
        puts "Invalid choice! Options: red, blue, green, pink"
      end
    end
    Players.new(guess)
  end
end

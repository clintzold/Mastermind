class Players
  include Gameplay
  attr_accessor :code, :name

  def initialize
    @code = [] 
    @name = ''
  end


  def enter_code 
    code = []
    options = ['red', 'blue', 'green', 'pink']
    puts "#{self.name}, please enter four colors(options: red, blue, green, pink): "
    while code.length < 4 do
      color = gets.chomp.downcase
      if options.any? {|option| option == color}
        code << color 
      else
        puts "Invalid choice! Options: red, blue, green, pink"
      end
      self.code = code
    end
  end
end

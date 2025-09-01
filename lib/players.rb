class Players
  include Gameplay
  attr_accessor :code, :name, :type

  def initialize(type)
    @code = [] 
    @name = ''
    @type = type
  end


  def enter_code 
    code = []
    options = ['red', 'blue', 'green', 'pink']
    puts "\n\n#{self.name}, please enter four colors(options: red, blue, green, pink): "
    while code.length < 4 do
      #Hides input from terminal if main code is being entered
      if self.name == "Code-Master"
        color = STDIN.noecho(&:gets).chomp.downcase
      else
        color = gets.chomp.downcase
      end

      if options.any? {|option| option == color}
        code << color 
      else
        puts "\nInvalid choice! Options: red, blue, green, pink"
      end
      self.code = code
    end
  end
end

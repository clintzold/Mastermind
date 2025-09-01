class Computers
  include Gameplay
  attr_accessor :code, :name

  def initialize
    @code = []
    @name = ''
  end

  def enter_code
    code = []
      4.times do |i|
      options = ['red', 'blue', 'green', 'pink']
      choice = rand(4)
      code << options[choice]
    end
  end
end

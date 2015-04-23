class Position

  attr_accessor :board, :turn

  def initialize
    @board=Array.new(@size, "-")
    @turn = "x"
  end
end

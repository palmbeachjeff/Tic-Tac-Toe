class Position

  attr_accessor :board, :turn
  DIMENSION = 3
  SIZE = DIMENSION * DIMENSION


  def initialize(board=nil, turn="x")
  @board = board || %w(-)*SIZE
  @turn = turn
  end
end
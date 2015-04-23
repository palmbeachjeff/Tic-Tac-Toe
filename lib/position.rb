class Position

  attr_accessor :board, :turn
  DIMENSION = 3
  SIZE = DIMENSION * DIMENSION


  def initialize(board=nil, turn="x")
  @board = board || %w(-)*SIZE
  @turn = turn
  end

  def move(index)
    position = Position.new(@board.dup, xturn("o", "x"))
    position.board[index] = turn
    position
  end

  def xturn(x,o)
    turn == "x" ? x : o
  end

  def possible_moves
    @board.map.with_index { |p,i| i if p == "-"}.compact
  end

  def win?(turn)
    
  end




end
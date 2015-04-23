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
    rows = @board.each_slice(DIMENSION).to_a
    rows.any? { |row| row.all? { |p| p==turn } } ||
    rows.transpose.any? {|col| col.all? { |p| p==turn} } ||
    rows.map.with_index.all? { |row,i| row[i]== turn } ||
    rows.map.with_index.all? { |row,i| row[DIMENSION-1-i]== turn }

  end




end
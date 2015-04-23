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

  def gameAI(depth=1)
    return 100 if win?("x")
    return -100 if win?("o")
    return 0 if possible_moves.empty?
    @@gameAI ||= {}
    value = @@gameAI[board]
    return value if value
    @@gameAI[@board] = possible_moves.map { |index| move(index).gameAI(depth+1)}.send(xturn(:max, :min)) + xturn(-depth,depth)
  end

  def best_move
    possible_moves.send(xturn(:max_by, :min_by)) { |index| move(index).gameAI }
  end
  



end
class Board
  def initialize
    @board = Array.new(3) { Array.new (3) { "_" } }
  end

  def valid?(pos)
    row, col = pos
    if @board[row][col] != nil
      return true
    end
    false
  end

  def empty?(pos)
    row, col = pos
    if @board[row][col] == "_"
      return true
    end
    false
  end

  def place_mark(pos, mark)
    unless valid?(pos)
      raise ArgumentError.new "Out of Bounds"
    end
    unless empty?(pos)
      raise ArgumentError.new "Spot is taken"
    end
    row, col = pos
    @board[row][col] = mark
  end
end

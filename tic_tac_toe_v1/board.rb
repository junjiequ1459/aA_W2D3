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

  def print
    p @board
  end

  def win_row?(mark)
    @board.each do |arr|
      if arr.all? { |e| e == mark }
        return true
      end
    end
    false
  end

  def win_col?(mark)
    temp_arr = []
    @board.each_with_index do |arr, i|
      @board.each_with_index do |arr, j|
        temp_arr << @board[j][i]
      end
      if temp_arr.all? { |e| e == mark }
        return true
      end
      temp_arr = []
    end
    false
  end

  def win_diagonal?(mark)
    size = (@board.size.clone) - 1
    upper_left = []
    upper_right = []

    @board.each_with_index do |ele, i|
      upper_left << @board[i][i]
      upper_right << @board[i][size - i]
    end

    if (upper_left.all? { |e| e == mark }) || (upper_right.all? { |e| e == mark })
      return true
    end
    false
  end

  def win?(mark)
    if self.win_col?(mark) || self.win_row?(mark) || self.win_diagonal?(mark)
      return true
    end
    false
  end

  def empty_positions?
    @board.each do |arr|
      arr.each do |ele|
        if ele == "_"
          return false
        end
      end
    end
    true
  end
end

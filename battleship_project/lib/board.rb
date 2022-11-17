class Board
  attr_reader :size

  def initialize(n)
    @n = n
    @grid = Array.new(n) { Array.new(n) { :N } }
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |arr|
      arr.each do |ele|
        if ele == :S
          count += 1
        end
      end
    end
    count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p "you sunk my battleship!"
      return true
    end
    self[pos] = :X
    false
  end

  def place_random_ships
    number_of_ships = @size / 4

    while number_of_ships > 0
      random_1 = rand(@n)
      random_2 = rand(@n)
      if self[[random_1, random_2]] != :S
        self[[random_1, random_2]] = :S
        number_of_ships -= 1
      end
    end
  end

  def hidden_ships_grid
    hidden_grid = @grid.map { |e| e.clone }

    hidden_grid.each_with_index do |arr, i|
      arr.each_with_index do |ele, j|
        if ele == :S
          hidden_grid[i][j] = :N
        end
      end
    end
    hidden_grid
  end

  def self.print_grid(arr)
    arr.each do |e|
      puts e.join(" ")
    end
  end

  def cheat
    self.class.print_grid(@grid)
  end

  def print
    self.class.print_grid(self.hidden_ships_grid)
  end
end

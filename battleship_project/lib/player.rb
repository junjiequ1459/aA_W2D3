class Player
  def get_move
    p "enter a position with coordinates seperated with a space like '4 7`"
    input = gets.chomp
    result = []
    input.each_char do |e|
      if e != " "
        result << e.to_i
      end
    end
    result
  end
end

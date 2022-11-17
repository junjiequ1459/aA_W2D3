string = "4 7"
result = []
string.each_char do |e|
  if e != " "
    result << e.to_i
  end
end
p result

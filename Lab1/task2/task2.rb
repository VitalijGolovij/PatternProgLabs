def coprime?(number1, number2)
  2.upto([number1, number2].min).each {|i| return false if (number1 % i).zero? and (number2 % i).zero?}
  true
end

def count_even_notcoprime(number)
  count = 0
  number.downto(2).each {|i| count += 1 if (i%2).zero? and not coprime?(number, i)}
  count
end

puts 'Введите число:'
number = STDIN.gets.to_i
puts "Количество четных и невзаимно простых с данным: #{count_even_notcoprime(number)}"

def coprime?(number1, number2)
  2.upto([number1, number2].min).each {|i| return false if (number1 % i).zero? and (number2 % i).zero?}
  true
end

def count_even_notcoprime(number)
  count = 0
  number.downto(2).each {|i| count += 1 if (i%2).zero? and not coprime?(number, i)}
  count
end

def max_dig_notdiv3(number)
  answ = -1
  number.digits.each {|dig| answ = dig if dig > answ and not (dig%3).zero?}
  answ
end

puts 'Введите число:'
number = STDIN.gets.to_i
puts "Количество четных и невзаимно простых с данным: #{count_even_notcoprime(number)}"
puts "Максимальная цифра числа, не делящаяся на 3: #{max_dig_notdiv3(number)}"
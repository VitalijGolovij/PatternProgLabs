def coprime?(number1, number2) 
  2.upto([number1, number2].min).each {|i| return false if (number1 % i).zero? and (number2 % i).zero?}
  true
end

def get_small_div(number)
  2.upto(number).each {|i|return i if (number%i).zero?}
end

def get_max_coprime(number)
  number.downto(2).each {|val| return val if not coprime?(val, number) and not (val % get_small_div(number)).zero?}
  return -1
end

def get_sum_dig_less5(number)
  digit_sum = 0
  number.digits.each {|dig| digit_sum += dig if dig<5}
  digit_sum
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

def mult_summ_dig(number)
  puts "Im mult #{get_max_coprime(number)} and #{get_sum_dig_less5(number)}"
  get_max_coprime(number) * get_sum_dig_less5(number)
end


puts 'Введите число:'
number = STDIN.gets.to_i
puts "Количество четных и невзаимно простых с данным: #{count_even_notcoprime(number)}"
puts "Максимальная цифра числа, не делящаяся на 3: #{max_dig_notdiv3(number)}"
puts "произведение максимального числа, не взаимно простого
с данным, не делящегося на наименьший делитель исходно числа, и
суммы цифр числа, меньших 5: #{mult_summ_dig(number)}"

# frozen_string_literal: true
def get_min_val(array)
  return nil if array.empty?
  min = array[0]
  for val in array
    min = val if val < min
  end
  min
end

def find_first_positiv(array)
  return nil if array.empty?
  array.each_index do |i|
    return i if array[i]>0
  end
  nil
end

if ARGV.size != 2
  puts "Некорректные аргументы"
  return
end

methods = %i[get_min_val find_first_positiv]
method_num = ARGV[0].to_i
file_path = ARGV[1]

file = File.open(file_path)
array = file.readline.split(' ').map{|val| val.to_i}

puts "Исходный массив: #{array}"
puts "Результат работы: #{method(methods[method_num]).call(array)}"













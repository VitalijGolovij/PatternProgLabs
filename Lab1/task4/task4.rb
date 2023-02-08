def idx_desc_order(array)
  return nil if array.nil?
  array.map.with_index { |val, idx| [val, idx] }.sort_by { |val| val[0] }.reverse.map{|val| val[1]}
end

def val_btw_first_second_max(array)
  new_array = array.clone
  max_idx1 = new_array.index(new_array.max)
  new_array[max_idx1] = new_array.min
  max_idx2 = new_array.index(new_array.max)
  array[[max_idx1, max_idx2].min + 1...[max_idx1, max_idx2].max]
end

def val_btw_first_last_max(array)
  new_array = array.clone
  max_idx1 = new_array.index(new_array.max)
  new_array[max_idx1] = new_array.min
  max_idx2 = array.size - new_array.reverse.index(new_array.max) - 1
  array[[max_idx1, max_idx2].min + 1...[max_idx1, max_idx2].max]
end

def min_even_val(array)
  return nil if array.empty?
  if array.min % 2 != 0
    new_array = array.clone
    new_array.delete_at(new_array.index(new_array.min))
    min_even_val(new_array)
  else
    array.min
  end
end

def prime_div_list(number, div_counter = 2, div_list = [])
  if number == div_counter
    return div_list << div_counter
  end
  if number % div_counter == 0
         div_list << div_counter
         prime_div_list(number / div_counter, div_counter, div_list)
    else
      prime_div_list(number, div_counter + 1, div_list)
    end
end

def input_array
  puts "Введите массив"
  array = STDIN.gets.split(' ').map{|val| val.to_i}
  array
end


puts "1. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность."
puts "2. Найти элементы, расположенные между первым и вторым максимальным."
puts "3. Найти элементы, расположенные между первым и последним максимальными."
puts "4. Найти минимальный четный элемент"
puts "5. Для введенного числа построить список всех его простых делителей,
причем если введенное число делится на простое число p в степени а , то в
итоговом списке число p должно повторятся a раз. Результирующий список упорядочен по возрастанию."

puts "\nВведите номер задачи:"
task_choice = STDIN.gets.to_i

case task_choice
  when task_choice = 1
    puts idx_desc_order(input_array)
  when task_choice = 2
    puts val_btw_first_second_max(input_array)
  when task_choice = 3
    puts val_btw_first_last_max(input_array)
  when task_choice = 4
    puts min_even_val(input_array)
  when task_choice = 5
    puts "Введите целочисленное число:"
    number = STDIN.gets.to_i
    puts prime_div_list(number)
  else
    puts "Не знаю таких задач =("
end

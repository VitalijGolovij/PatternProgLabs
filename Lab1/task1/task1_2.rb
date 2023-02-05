name = ARGV[0]

puts "Здравствуй, #{name}, какой язык программирования твой любимый?"

lang = STDIN.gets.chomp.downcase

case lang
when "ruby"
  puts "Подлиза!"
when "java"
  puts "Хороший вариант, но я бы выбрал Ruby"
when "C#"
  puts "Это интересно, но возьми Ruby"
when "python"
  puts "Полностью согла...ой то есть бери Ruby"
else 
  puts "Ruby Ruby Ruby"
end


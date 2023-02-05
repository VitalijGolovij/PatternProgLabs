puts "Введи команду ruby"
cmd_ruby = STDIN.gets.chomp
system "ruby \"#{cmd_ruby}\""

puts "Введите команду ОС"
cmd_os = STDIN.gets.chomp
system cmd_os

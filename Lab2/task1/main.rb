require File.expand_path(File.dirname(__FILE__) + '/Student.rb')

student1 = Student.new('Егор','Крид','Валерьевич', id:1,
                   phone:'+79185671244', telegram:'@egorcheek',
                   mail:'egorik@mail.ru',git:'github.com/egorIT')
student2 = Student.new('Василий','Леонов','Федеровчи', id:2,
                   phone:'+7 918 878 54 09', telegram:'@dadaka',
                   mail:'ngiuaf@mail.ru',git:'github.com/hshgs')
student3 = Student.new('Кирилл','Додонов','Иванович', id:3, telegram:'@kokhuba')

puts student1.to_s
puts "---------------------"
puts student2.to_s
puts "---------------------"
puts student3.to_s

student1.phone = '+71111111111'
puts student1.phone

student4 = Student.new('Борис', 'Лоров', 'Анатольевич')
puts student4.validate
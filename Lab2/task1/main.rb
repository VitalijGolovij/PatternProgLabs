require File.expand_path(File.dirname(__FILE__) + '/Student.rb')

student1 = Student.new(name:'Егор',surname:'Крид',patronymic: 'Валерьевич', id:1,
                   phone:'+79185671244', telegram:'@egorcheek',
                   mail:'egorik@mail.ru',git:'github.com/egorIT')
student2 = Student.new(name:'Василий',surname: 'Леонов',patronymic: 'Федеровчи', id:2,
                   phone:'+7 918 878 54 09', telegram:'@dadaka',
                   mail:'ngiuaf@mail.ru',git:'github.com/hshgs')
student3 = Student.new(name: 'Кирилл',surname: 'Додонов',patronymic: 'Иванович', id:3, telegram:'@kokhuba')

puts student1
puts "---------------------"
puts student2
puts "---------------------"
puts student3


student4 = Student.new(name: 'Борис', surname: 'Лоров', patronymic: 'Анатольевич')
puts student4.validate
student4.set_contacts(phone:'+70000000000')
puts student4
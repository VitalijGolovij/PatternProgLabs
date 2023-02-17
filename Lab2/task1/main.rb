require File.expand_path(File.dirname(__FILE__) + '/Student.rb')

student1 = Student.new('Егор','Крид','Валерьевич', id:1,
                   phone:'+79185671244', telegram:'@egorcheek',
                   mail:'egorik@mail.ru',git:'egorIT')
student2 = Student.new('Василий','Леонов','Федеровчи', id:2,
                   phone:'+79188785409', telegram:'@dadaka',
                   mail:'ngiuaf@mail.ru',git:'hshgs')
student3 = Student.new('Кирилл','Додонов','Иванович', id:3,
                   phone:'+79185997854', telegram:'@kokhuba')

student1.print
student2.print
student3.print
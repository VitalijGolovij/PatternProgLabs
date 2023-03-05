require 'json'
require File.expand_path(File.dirname(__FILE__) + '/Student.rb')
require File.expand_path(File.dirname(__FILE__) + '/Student_short.rb')

student4 = Student.new(id:1, name:'Егор',surname:'Крид',patronymic: 'Валерьевич', git:'github.com/aaa', mail:'aa@maiil.com')
student4.set_contacts(phone:'+70000000000')


short1 = Student_short.new(3,Student_short.to_json_str("Буквоедов А. Н.","github.com/sss"))
puts short1.id
puts short1.shortname
puts short1.contact
puts short1.git

short2 = Student_short.from_student(student4)
puts short2.id
puts short2.shortname
puts short2.contact
puts short2.git
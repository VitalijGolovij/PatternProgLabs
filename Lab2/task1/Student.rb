class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone,
                :telegram, :mail, :git

  def initialize(name, surname, patronymic, id:nil, phone:nil,
                 telegram:nil, mail:nil, git:nil)
    self.name = name
    self.surname = surname
    self.patronymic = patronymic
    self.id = id
    self.phone = phone
    self.telegram = telegram
    self.mail = mail
    self.git = git
  end

  def print
    puts "Information about student"
    puts "id: #{self.id}" unless self.id.nil?
    puts "name: #{self.name}"
    puts "surname: #{self.surname}"
    puts "patronymic: #{self.patronymic}"
    puts "phone: #{self.phone}" unless self.phone.nil?
    puts "telegram: #{self.telegram}" unless self.telegram.nil?
    puts "mail: #{self.mail}" unless self.mail.nil?
    puts "git: #{self.git}" unless self.git.nil?
  end
end

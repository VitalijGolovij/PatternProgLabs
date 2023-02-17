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
end


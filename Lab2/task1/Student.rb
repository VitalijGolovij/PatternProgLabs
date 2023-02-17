class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone,
                :telegram, :mail, :git

  def initialize(name, surname, patronymic, options = {})
    self.name = name
    self.surname = surname
    self.patronymic = patronymic
    self.id = options[:id]
    self.phone = options[:phone]
    self.telegram = options[:telegram]
    self.mail = options[:mail]
    self.git = options[:git]
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

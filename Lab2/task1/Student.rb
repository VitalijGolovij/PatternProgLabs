class Student
  attr_accessor :id, :surname, :name, :patronymic,
                :telegram, :mail, :git, :phone

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

  def phone=(other)
    raise ArgumentError, "arg '#{other}' is not valid for phone" unless Student.is_phone?(other)
    @phone = other
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

  def self.is_phone?(phone)
    raise ArgumentError, "arg '#{phone}' is not string" unless phone.class == String or phone.nil?
    return true if phone=~/^(\+7|8)\s?(\(\d{3}\)|\d{3})[\s\-]?\d{3}[\s\-]?\d{2}[\s\-]?\d{2}/ or phone.nil?
    false
  end
end


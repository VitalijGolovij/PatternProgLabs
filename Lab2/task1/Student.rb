class Student
  attr_reader :phone, :id, :surname, :name, :patronymic,
              :telegram, :mail, :git

  def initialize(name:, surname:, patronymic:, id:nil, phone:nil, telegram: nil, mail:nil, git:nil)
    self.name = name
    self.surname = surname
    self.patronymic = patronymic
    self.id = id
    self.phone = phone
    self.telegram = telegram
    self.mail = mail
    self.git = git
  end

  #add or change contact details
  def set_contacts(contacts)
    self.phone = contacts[:phone] unless contacts[:phone].nil?
    self.mail = contacts[:mail] unless contacts[:mail].nil?
    self.telegram = contacts[:telegram] unless contacts[:telegram].nil?
  end

  #setters
  def phone=(other)
    raise ArgumentError, "arg '#{other}' is not valid for phone" unless Student.is_phone?(other)
    @phone = other
  end

  def name=(other)
    raise ArgumentError, "arg '#{other}' is not valid for name" unless Student.is_name?(other)
    @name = other
  end

  def surname=(other)
    raise ArgumentError, "arg '#{other}' is not valid for surname" unless Student.is_name?(other)
    @surname = other
  end

  def patronymic=(other)
    raise ArgumentError, "arg '#{other}' is not valid for patronymic" unless Student.is_name?(other)
    @patronymic = other
  end

  def id=(other)
    raise ArgumentError, "arg '#{other}' is not valid for id (must be int)" unless other.class == Integer or other.nil?
    raise ArgumentError, "arg '#{other}' is not valid for id (must be greater than zero)" if other.class == Integer and other < 0
    @id = other
  end

  def mail=(other)
    raise ArgumentError, "arg '#{other}' is not valid for mail (must be string)" unless Student.is_mail?(other)
    @mail = other
  end

  def telegram=(other)
    raise ArgumentError, "arg '#{other}' is not valid for telegram (must be string)" unless Student.is_telegram?(other)
    @telegram = other
  end

  def git=(other)
    raise ArgumentError, "arg '#{other}' is not valid for id (must be int)" unless Student.is_git?(other)
    @git = other
  end

  #get information about class fields
  def to_s
    res = "Information about student\n"
    res += "id: #{self.id}\n" unless self.id.nil?
    res += "name: #{self.name}\n"
    res += "surname: #{self.surname}\n"
    res += "patronymic: #{self.patronymic}\n"
    res += "phone: #{self.phone}\n" unless self.phone.nil?
    res += "telegram: #{self.telegram}\n" unless self.telegram.nil?
    res += "mail: #{self.mail}\n" unless self.mail.nil?
    res += "git: #{self.git}\n" unless self.git.nil?
    res
  end

  #validation of data
  def validate
    have_git? and have_contact?
  end

  def have_git?
    !self.git.nil?
  end

  def have_contact?
    !(self.phone.nil? and self.telegram.nil? and self.mail.nil?)
  end

  def self.is_phone?(phone)
    raise ArgumentError, "arg '#{phone}' is not string" unless phone.class == String or phone.nil?
    return true if phone=~/^(\+7|8)\s?(\(\d{3}\)|\d{3})[\s\-]?\d{3}[\s\-]?\d{2}[\s\-]?\d{2}/ or phone.nil?
    false
  end

  def self.is_name?(name)
    raise ArgumentError, "arg '#{name}' is not string" unless name.class == String
    return true if name=~/^[А-Яа-я]+$/
    false
  end

  def self.is_mail?(mail)
    raise ArgumentError, "arg '#{mail}' is not string" unless mail.class == String or mail.nil?
    return true if mail=~/^[^@\s]+@[^@\s]+\.\w+$/ or mail.nil?
    false
  end

  def self.is_telegram?(telegram)
    raise ArgumentError, "arg '#{telegram}' is not string" unless telegram.class == String or telegram.nil?
    return true if telegram=~/^@[^@]+$/ or telegram.nil?
    false
  end

  def self.is_git?(git)
    raise ArgumentError, "arg '#{git}' is not string" unless git.class == String or git.nil?
    return true if git=~/^github\.com\/[a-zA-Z0-9\-_]+$/ or git.nil?
    false
  end
end


require 'json'
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

  #init from json string
  def self.from_json_str(str)
    args = JSON.parse(str)

    raise ArgumentError, "arg '#{str} most have keys 'name', 'surname' and 'patronymic'" unless
      (args.has_key?('name') and args.has_key?('surname') and args.has_key?('patronymic'))

    new(name: args['name'], surname: args['surname'], patronymic: args['patronymic'], id: args['id'],
        phone: args['phone'], telegram: args['telegram'], mail: args['mail'], git: args['git'])
  end

  def get_shortname
    self.name + " " + self.surname[0].upcase + ". " + self.patronymic[0].upcase + "."
  end
# а зачем два геттера для гита? у вас уже один есть
  def get_git
    self.git unless self.git.nil?
  end

  def get_contact
    return "phone number: " + self.phone unless self.phone.nil?
    return "mail: " + self.mail unless self.mail.nil?
    "telegram: " + self.telegram unless self.telegram.nil?
  end

  def get_info
    info = "{\"#{:shortname.to_s}\": \"#{get_shortname}\"}"
    info.insert(-2, ", \"git\":\"#{get_git}\"")  unless get_git.nil?
    info.insert(-2,",\"contact\":\"#{get_contact}\" ") unless get_contact.nil?
    info
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
  def validate?
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


require 'json'
require_relative 'Student_short'

class Student < Student_short
  #запривачиваем ненужный конструктор
  private_class_method :from_student

  #добавили фамилию и отчество
  attr_reader :surname, :patronymic

  def initialize(name:, surname:, patronymic:, id:nil, git:nil, phone:nil, mail:nil, telegram: nil)
    self.id = id
    self.name = name
    self.surname = surname
    self.patronymic = patronymic
    self.git = git
    @contact = Hash.new
    set_contact(phone: phone, mail: mail, telegram: telegram)
  end

  #init from json string
  def self.from_json_str(str)
    args = JSON.parse(str)

    raise ArgumentError, "arg '#{str} most have keys 'name', 'surname' and 'patronymic'" unless
      (args.has_key?('name') and args.has_key?('surname') and args.has_key?('patronymic'))

    new(name: args['name'], surname: args['surname'], patronymic: args['patronymic'], id: args['id'],
        phone: args['phone'], telegram: args['telegram'], mail: args['mail'], git: args['git'])
  end

  def self.read_from_txt(file_path)
    student_array = Array.new
    if File.exist?(file_path)
      file = File.new(file_path, "r:UTF-8")
      lines = file.read.to_s.strip
      cur_str = ""
      lines.each_char do |char|
        cur_str += char
        if char == '}'
          student_array.append(Student.from_json_str(cur_str))
          cur_str = ""
        end
      end
    else
      raise ArgumentError, "file in path '#{file_path}' not found"
    end
    student_array
  end

  def shortname
    self.name + " " + self.surname[0].upcase + ". " + self.patronymic[0].upcase + "."
  end

  def contact
    return "{\"phone\": \"#{self.phone}\"}" unless self.phone.nil?
    return "{\"mail\": \"#{self.mail}\"}" unless self.mail.nil?
    "{\"telegram\": \"#{self.telegram}\"}" unless self.telegram.nil?
  end

  def get_info
    info = "{\"#{:name.to_s}\": \"#{shortname}\"}"
    info.insert(-2, ", \"git\":\"#{self.git}\"")  unless self.git.nil?
    info.insert(-2,",\"contact\":#{self.contact}") unless self.contact.nil?
    info
  end

  def phone
    @contact['phone']
  end

  def mail
    @contact['mail']
  end

  def telegram
    @contact['telegram']
  end

  #setters
  def set_contact(phone:nil, mail:nil, telegram:nil)
    self.phone = phone
    self.mail = mail
    self.telegram = telegram
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

  def phone=(other)
    raise ArgumentError, "arg '#{other}' is not valid for phone" unless Student.is_phone?(other)
    @contact['phone'] = other
  end

  def mail=(other)
    raise ArgumentError, "arg '#{other}' is not valid for mail" unless Student.is_mail?(other)
    @contact['mail'] = other
  end

  def telegram=(other)
    raise ArgumentError, "arg '#{other}' is not valid for telegram" unless Student.is_telegram?(other)
    @contact['telegram'] = other
  end

  def id=(other)
    raise ArgumentError, "arg '#{other}' is not valid for id (must be int)" unless other.class == Integer or other.nil?
    raise ArgumentError, "arg '#{other}' is not valid for id (must be greater than zero)" if other.class == Integer and other < 0
    @id = other
  end

  def git=(other)
    raise ArgumentError, "arg '#{other}' is not valid for git" unless Student.is_git?(other)
    @git = other
  end

  #validation of data
  def validate?
    have_git? and have_contact?
  end

  def have_git?
    !self.git.nil?
  end

  def have_contact?
    !(self.contact.size == 0)
  end

  def self.is_name?(name)
    raise ArgumentError, "arg '#{name}' is not string" unless name.class == String
    return true if name=~/^[А-Яа-я]+$/
    false
  end

  def self.is_phone?(phone)
    raise ArgumentError, "arg '#{phone}' is not string" unless phone.class == String or phone.nil?
    return true if phone=~/^(\+7|8)\s?(\(\d{3}\)|\d{3})[\s\-]?\d{3}[\s\-]?\d{2}[\s\-]?\d{2}/ or phone.nil?
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

  #get information about class fields
  def to_s
    res = "{\"name\":\"#{self.name}\", \"surname\":\"#{self.surname}\",\"patronymic\":\"#{self.patronymic}\"}"
    res.insert(-2,",\"id\":\"#{self.id}\"") unless self.id.nil?
    res.insert(-2,",\"git\":\"#{self.git}\"") unless self.git.nil?
    res.insert(-2,",\"phone\":\"#{self.phone}\"") unless self.phone.nil?
    res.insert(-2,",\"mail\":\"#{self.mail}\"") unless self.mail.nil?
    res.insert(-2,",\"telegram\":\"#{self.telegram}\"") unless self.telegram.nil?
    res
  end
end
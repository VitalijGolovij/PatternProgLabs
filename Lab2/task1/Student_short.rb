# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/Student.rb')
require 'json'

class Student_short
  #private setters
  private
  attr_writer :id

  def shortname=(shortname)
    raise ArgumentError, "arg #{:shortname.to_s} must be string" unless shortname.class == String
    raise ArgumentError, "arg '#{shortname}' not valid" unless Student_short.is_shortname?(shortname)
    @shortname = shortname
  end

  def contact=(contact)
    raise ArgumentError, "arg #{:contact.to_s} must be string" unless contact.class == String or contact.nil?
    @contact = contact
  end

  def git=(git)
    raise ArgumentError, "arg #{:git.to_s} must be string" unless git.class == String or git.nil?
    raise ArgumentError, "arg '#{git}' not valid" unless Student_short.is_git?(git)
    @git = git
  end

  public
  attr_reader :id, :shortname, :git, :contact

  def initialize(id, json_str)
    raise ArgumentError, "arg '#{:id}' must be integer" unless id.class == Integer
    self.id = id

    args = JSON.parse(json_str)

    raise ArgumentError, "arg '#{:json_str}' must have key '#{:shortname}'" unless args.has_key?(:shortname.to_s)

    self.shortname = args[:shortname.to_s]
    self.git = args[:git.to_s]
    self.contact = args[:contact.to_s]
  end

  #initialize from Student class object
  def self.from_student(student)
    new(student.id, to_json_str(student.get_shortname, student.get_git, student.get_contact))
  end

  #get json string
  def self.to_json_str(shortname, git = nil, contact = nil)
    JSON.generate({ :shortname => shortname, :git => git, :contact => contact}).to_s
  end

  #validate of data
  def self.is_shortname?(shortname)
    true if shortname=~/^[a-zA-Zа-яА-Я .]+$/
  end

  def self.is_git?(git)
    Student.is_git?(git)
  end
end



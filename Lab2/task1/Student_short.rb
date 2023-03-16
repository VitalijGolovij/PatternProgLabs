# frozen_string_literal: true
require 'json'

class Student_short
  public
  attr_reader :id, :name, :git, :contact

  def initialize(id, json_str)
    @id = id

    args = JSON.parse(json_str)

    @name = args['name']
    @git = args['git']
    @contact = args["contact"]
  end

  def self.from_student(student)
    new(student.id, student.get_info)
  end

  def validate?
    have_git? and have_contact?
  end

  def have_git?
    !self.git.nil?
  end

  def have_contact?
    !self.contact.nil?
  end

end


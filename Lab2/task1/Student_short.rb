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
    @contact = args["contact"][args["contact"].keys.at(0)] unless args["contact"].nil?
  end

  def self.from_student(student)
    new(student.id, student.get_info)
  end
end


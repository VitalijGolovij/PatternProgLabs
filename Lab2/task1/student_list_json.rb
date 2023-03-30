# frozen_string_literal: true
require_relative 'student_list'

class Student_list_JSON < Student_list
  public_class_method :new

  def initialize(file_path)
    super()
    @file_reader.from_json(file_path, self)
  end

  def write_to_json(file_path)
    @file_writer.to_json(file_path, self)
  end
end

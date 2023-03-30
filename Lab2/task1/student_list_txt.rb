# frozen_string_literal: true
require_relative 'student_list'

class Student_list_txt < Student_list
  public_class_method :new

  def initialize(txt_file_path)
    super()
    @file_reader.from_txt(txt_file_path, self)
  end

  def write_to_txt(file_path)
    @file_writer.to_txt(file_path, self)
  end
end

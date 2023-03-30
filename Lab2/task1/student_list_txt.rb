# frozen_string_literal: true
require_relative 'student_list'

class Student_list_txt < Student_list
  public_class_method :new

  def initialize(txt_file_path)
    super()
    Student.read_from_txt(txt_file_path).each { |student| put_student(student) }
  end

  def write_to_txt(file_path)
    Student.write_to_txt(self.list, file_path)
  end
end

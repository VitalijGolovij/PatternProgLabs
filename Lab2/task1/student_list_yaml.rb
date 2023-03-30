# frozen_string_literal: true
require 'yaml'

class Student_list_YAML < Student_list
  public_class_method :new

  def initialize(file_path)
    super()
    YAML.load(File.read(file_path)).each{|hash_for_student| put_student(Student.new(hash_for_student))}
  end

  def write_to_yaml(file_path)
    student_hash_list = []
    self.list.each{ |student| student_hash_list.append(student.to_hash) }
    File.write(file_path, YAML.dump(student_hash_list))
  end
end

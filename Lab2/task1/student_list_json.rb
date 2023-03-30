# frozen_string_literal: true
require_relative 'student_list'

class Student_list_JSON < Student_list
  public_class_method :new

  def initialize(file_path)
    super()
    JSON.load(File.open(file_path)).each{|hash_for_student| put_student(Student.new(hash_for_student))}
  end

  def write_to_json(file_path)
    student_hash_list = []
    self.list.each{ |student| student_hash_list.append(student.to_hash) }
    File.open(file_path,'w') do |file|
      JSON.dump(student_hash_list,file)
    end
  end
end

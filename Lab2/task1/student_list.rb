# frozen_string_literal: true
require_relative 'data_list'
require_relative 'file_reader_for_student_list'
require_relative 'file_writer_for_student_list'

class Student_list < Data_list
  attr_reader :student_list

  private_class_method :new

  def initialize
    self.list=[]
    @file_reader = File_reader_for_student_list.new
    @file_writer = File_writer_for_student_list.new
    @id_counter = 1
  end

  def get_student_by_id(id)
    self.list.find{ |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    if data_list
      raise ArgumentError, "overflow indexes" if data_list.list.size < k * (n - 1) + 1
      Data_list_student_short.new(data_list.list[k * (n - 1), k])
    else
      raise ArgumentError, "overflow indexes" if self.list.size < k * (n - 1) + 1
      Data_list_student_short.new(self.list[k * (n - 1), k].map { |student| Student_short.from_student(student) } )
    end
  end

  def sort_by_shortname
    self.list.sort_by! { |student | student.shortname }
  end

  def put_student(student, index = self.list.size)
    raise ArgumentError, "arg must be Student" unless student.class == Student

    student.id = @id_counter
    self.list[index] = student
    @id_counter += 1
  end

  def replace_by_id(id, student)
    replace_index = self.list.find_index{|old_student| old_student.id == id}
    put_student(student, replace_index)
  end

  def drop_by_id(id)
    self.list.delete_if {|student| student.id == id}
  end

  def get_student_short_count
    self.list.size
  end
end

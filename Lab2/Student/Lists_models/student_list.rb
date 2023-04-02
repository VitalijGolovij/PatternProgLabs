# frozen_string_literal: true
require_relative 'data_list'
require_relative 'student_list_file_worker'

class Student_list < Data_list
  attr_reader :student_list


  def initialize(student_list_file_worker)
    self.list=[]
    set_file_worker(student_list_file_worker)
    @id_counter = 1
  end

  def set_file_worker(student_list_file_worker)
    raise ArgumentError, "arg must be  an inheritor of the Student_list_file_worker class" unless student_list_file_worker.kind_of?(Student_list_file_worker)
    @file_worker = student_list_file_worker
  end

  def read_from_file(file_path)
    self.list = @file_worker.read_from_file(file_path)
  end

  def write_to_file(file_path)
    hash_list = self.list.map{|student| student.to_hash}
    @file_worker.write_to_file(file_path, hash_list)
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
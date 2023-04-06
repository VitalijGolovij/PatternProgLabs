# frozen_string_literal: true
require_relative 'student_list'
require_relative '../database/class/database_student_worker'
require 'mysql2'
require 'yaml'

class Student_list_DB < Student_list
  def initialize(options = {})
    @db_worker = Database_student_worker.new(options)
    update_list
  end

  protected def update_list
    self.list = @db_worker.select_all
  end

  def get_student_by_id(id)
    update_list
    super
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    update_list
    super
  end

  def put_student(student)
    @db_worker.insert_student(student.to_hash)
    update_list
  end

  def replace_by_id(id, student)
    @db_worker.update_by_id(id, student.to_hash)
    update_list
  end

  def drop_by_id(id)
    @db_worker.delete_by_id(id)
    update_list
  end

  def get_student_short_count
    update_list
    super
  end

  def list
    update_list
    @list
  end
end

# frozen_string_literal: true
require_relative '../Lists_models/student_list'
require_relative '../Lists_models/student_list_file_adapter'
require_relative '../Lists_models/student_list_json'
require_relative '../Lists_models/student_list_db'
require 'yaml'
require 'json'
require 'fox16'
include Fox

class Student_list_controller
  def initialize(view)
    @view = view

    # @student_list = Student_list.new(Student_list_file_adapter.new(Student_list_JSON.new, 'result_files/input.json'))
    @student_list = Student_list.new(Student_list_DB.new(YAML.load(File.open('database/config/connect_db_hash.yaml'))))
    @cur_table_page = 1
    @all_table_pages = (@student_list.get_students_count.to_f / 20.0).ceil
  end

  def refresh_data(table_page_num)
    @data_list_student_short = @student_list.get_k_n_student_short_list(20,table_page_num)
    @data_list_student_short.add_observer(@view)
    @data_list_student_short.notify

    set_page_count
  end

  def add_student

  end

  def delete_student

  end

  def edit_student

  end

  def set_page_count
    @view.pages_count.text= "#{@cur_table_page}/#{@all_table_pages}"
  end

  def next_page
    if(@cur_table_page < @all_table_pages)
      @cur_table_page += 1
      refresh_data(@cur_table_page)
    end
  end

  def prev_page
    if(@cur_table_page>1)
      @cur_table_page -= 1
      refresh_data(@cur_table_page)
    end
  end
end

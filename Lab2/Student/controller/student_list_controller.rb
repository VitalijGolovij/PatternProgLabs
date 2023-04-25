# frozen_string_literal: true
require_relative '../Lists_models/student_list'
require_relative '../Lists_models/student_list_file_adapter'
require_relative '../Lists_models/student_list_json'
require_relative '../Lists_models/student_list_db'
require_relative '../view/add_student_window'
require 'yaml'
require 'json'
require 'fox16'
include Fox

class Student_list_controller
  attr_reader :student_list
  def initialize(view)
    @view = view

    @student_list = Student_list.new(Student_list_file_adapter.new(Student_list_JSON.new, 'result_files/input.json'))
    # @student_list = Student_list.new(Student_list_DB.new(YAML.load(File.open('database/config/connect_db_hash.yaml'))))

    @cur_table_page = 1
    @all_table_pages = (@student_list.get_students_count.to_f / 20.0).ceil
    @data_list_student_short = @student_list.get_k_n_student_short_list(20, @cur_table_page)
    @data_list_student_short.add_observer(@view)
  end

  def refresh_data
    @data_list_student_short.list = @student_list.get_k_n_student_short_list(20,@cur_table_page).list

    set_page_counter
  end

  def add_student
    dialog_box = Add_student_window.new(@view)
    dialog_box.create
    dialog_box.show(PLACEMENT_SCREEN)
    refresh_data
  end


  def delete_student

  end

  def edit_student

  end

  def set_page_counter
    @view.pages_count.text= "#{@cur_table_page}/#{@all_table_pages}"
  end

  def next_page
    if(@cur_table_page < @all_table_pages)
      @cur_table_page += 1
      refresh_data
    end
  end

  def prev_page
    if(@cur_table_page>1)
      @cur_table_page -= 1
      refresh_data
    end
  end
end

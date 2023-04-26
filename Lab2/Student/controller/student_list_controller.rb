# frozen_string_literal: true
require_relative '../Lists_models/student_list'
require_relative '../Lists_models/student_list_file_adapter'
require_relative '../Lists_models/student_list_json'
require_relative '../Lists_models/student_list_db'
require_relative '../view/add_student_window'
require_relative '../Lists_models/data_list_student_short'
require 'yaml'
require 'json'
require 'fox16'
include Fox

class Student_list_controller
  attr_reader :student_list
  def initialize(view)
    @view = view
    @students_count_on_page = 20
    @student_list = Student_list.new(Student_list_file_adapter.new(Student_list_JSON.new, 'result_files/input.json'))
    # @student_list = Student_list.new(Student_list_DB.new(YAML.load(File.open('database/config/connect_db_hash.yaml'))))

    @cur_table_page = 1
    @all_table_pages = (@student_list.get_students_count.to_f / @students_count_on_page.to_f).ceil
    @data_list_student_short = @student_list.get_k_n_student_short_list(@students_count_on_page, @cur_table_page)
    @data_list_student_short.add_observer(@view)
  end

  def refresh_data
    @data_list_student_short.list = @student_list.get_k_n_student_short_list(@students_count_on_page, @cur_table_page, filter).list
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

  def filter
    list_before_filter = @student_list.get_k_n_student_short_list(@student_list.get_students_count, 1).list
    list_after_filter = []

    name_field_text = @view.shortname_field.text == '' ? nil : @view.shortname_field.text
    git_field_text = @view.parameters_fields['git'].text == '' ? nil : @view.parameters_fields['git'].text
    phone_field_text = @view.parameters_fields['phone'].text == '' ? nil : @view.parameters_fields['phone'].text
    mail_field_text = @view.parameters_fields['mail'].text == '' ? nil : @view.parameters_fields['mail'].text
    telegram_field_text = @view.parameters_fields['telegram'].text == '' ? nil : @view.parameters_fields['telegram'].text

    list_before_filter.each do |student_short|
      if name_field_text
        list_after_filter << student_short if student_short.name.include?(name_field_text)
        next
      end
      if git_field_text and student_short.git
        list_after_filter << student_short if student_short.git.include?(git_field_text)
        next
      end
      if phone_field_text and student_short.contact
        list_after_filter << student_short if student_short.contact.include?(phone_field_text)
        next
      end
      if mail_field_text and student_short.contact
        list_after_filter << student_short if student_short.contact.include?(mail_field_text)
        next
      end
      if telegram_field_text and student_short.contact
        list_after_filter << student_short if student_short.contact.include?(telegram_field_text)
        next
      end
    end

    is_all_filters_empty =  !(
      name_field_text or git_field_text or
      phone_field_text or mail_field_text or telegram_field_text
    )

    if is_all_filters_empty
      nil
    else
      Data_list_student_short.new(list_after_filter)
    end
  end

  def get_all_table_pages_count

  end
end

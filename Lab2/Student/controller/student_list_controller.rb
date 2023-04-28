# frozen_string_literal: true
require_relative '../Lists_models/student_list'
require_relative '../Lists_models/student_list_file_adapter'
require_relative '../Lists_models/student_list_json'
require_relative '../Lists_models/student_list_db'
require_relative '../view/input_student_window'
require_relative '../Lists_models/data_list_student_short'
require 'yaml'
require 'json'
require 'fox16'
include Fox

class Student_list_controller
  attr_reader :student_list
  def initialize(view)
    @view = view
    reset_buttons
    @students_count_on_page = 20
    # @student_list = Student_list.new(Student_list_file_adapter.new(Student_list_JSON.new, 'result_files/input.json'))
    @student_list = Student_list.new(Student_list_DB.new(YAML.load(File.open('database/config/connect_db_hash.yaml'))))

    @cur_table_page = 1
    @data_list_student_short = @student_list.get_k_n_student_short_list(@students_count_on_page, @cur_table_page)
    set_all_table_pages_count(@student_list.get_k_n_student_short_list(@student_list.get_students_count, 1))
    @data_list_student_short.add_observer(@view)
  end

  def refresh_data
    data_list_after_filter = @student_list.get_k_n_student_short_list(@students_count_on_page, @cur_table_page, filter)
    @data_list_student_short.list = data_list_after_filter.list
    reset_buttons
    set_page_counter
  end

  def process_filters
    @cur_table_page = 1
    refresh_data
  end

  def add_student
    dialog_box = InputStudentWindow.new(@view)
    dialog_box.create
    dialog_box.show(PLACEMENT_SCREEN)
  end

  def delete_student
    if @view.table.anythingSelected? and !selected_empty_row?
      first_selected = @view.table.selStartRow
      last_selected = @view.table.selEndRow

      (first_selected..last_selected).each do |selected_row|
        @student_list.drop_by_id(@view.table.getItemText(selected_row,0))
      end

      refresh_data
    end
  end

  def edit_student
    if selected_one_row? and !selected_empty_row?
      selected_row = @view.table.selStartRow
      selected_student = @student_list.get_student_by_id(@view.table.getItemText(selected_row,0))
      dialog_box = InputStudentWindow.new(@view, selected_student)
      dialog_box.create
      dialog_box.show(PLACEMENT_SCREEN)
    else
      @view.edit_button.state = STATE_DOWN
    end
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

  def process_select_cell
    if @view.table.anythingSelected? and !selected_empty_row?
      @view.delete_button.state = STATE_UP
      if selected_one_row?
        @view.edit_button.state = STATE_UP
      else
        @view.edit_button.state = STATE_DOWN
      end
    else
        @view.edit_button.state = STATE_DOWN
        @view.delete_button.state = STATE_DOWN
      end
  end


  protected
  def selected_empty_row?
    first_selected = @view.table.selStartRow
    last_selected = @view.table.selEndRow

    (first_selected..last_selected).each do |selected_row|
      if @view.table.getItemText(selected_row,0) == ''
        return true
      end
    end
    false
  end
  def selected_one_row?
    if @view.table.anythingSelected? and @view.table.selEndRow - @view.table.selStartRow == 0
      true
    else
      false
    end
  end

  def reset_buttons
    @view.edit_button.state = STATE_DOWN
    @view.delete_button.state = STATE_DOWN
  end

  def set_page_counter
    @view.pages_count.text= "#{@cur_table_page}/#{@all_table_pages}"
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

    if all_filters_empty?
      set_all_table_pages_count(@student_list.get_k_n_student_short_list(@student_list.get_students_count, 1))
      nil
    else
      data_list = Data_list_student_short.new(list_after_filter)
      set_all_table_pages_count(data_list)
      data_list
    end
  end

  def all_filters_empty?
    (
      @view.shortname_field.text == '' and
        @view.parameters_fields['git'].text == '' and
        @view.parameters_fields['phone'].text == '' and
        @view.parameters_fields['mail'].text == '' and
        @view.parameters_fields['telegram'].text == ''
    )
  end

  def set_all_table_pages_count(data_list_student_short)
    @all_table_pages = (data_list_student_short.list.size.to_f / @students_count_on_page.to_f).ceil
    if @all_table_pages == 0
      @all_table_pages = 1
    end
  end
end

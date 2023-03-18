# frozen_string_literal: true
require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list
  def get_names
    @list[0].instance_variables - [:@id]
  end

  def get_data
    table = []

    @list.each do |student|
      row = []
      row << table.size
      get_names.each do |attr_name|
        row << student.instance_variable_get(attr_name)
      end
      table << row
    end
    Data_table.new(table)
  end

end

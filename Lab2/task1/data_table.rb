# frozen_string_literal: true
require 'json'

class Data_table
  def initialize(objects_array)
    @table = []
    objects_array.each do |object|
      row = []
      object.instance_variables.each{|arg| row << object.instance_variable_get(arg)}
      @table << row
    end
  end

  def get_elem(index_row, index_column)
    @table[index_row][index_column]
  end

  def rows_count
    @table.size
  end

  def columns_count
    count = 0
    @table.each { |row| count = row.size if row.size > count }
    count
  end
end

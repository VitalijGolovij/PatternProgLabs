require 'json'
require_relative 'data_list'

class Data_table
  def initialize(objects_table)
    @table = objects_table
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

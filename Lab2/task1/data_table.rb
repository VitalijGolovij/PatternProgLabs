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
end
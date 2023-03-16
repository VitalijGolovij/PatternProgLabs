# frozen_string_literal: true
require 'json'
require_relative 'Student'

class Data_table
  def initialize(student_list)
    @table = []
    student_list.each do |student|
      @table << JSON.parse(student.to_s).values
    end
  end
end
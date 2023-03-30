# frozen_string_literal: true
require 'yaml'

class Student_list_YAML < Student_list
  public_class_method :new

  def initialize(file_path)
    super()
    @file_reader.from_yaml(file_path, self)
  end

  def write_to_yaml(file_path)
    @file_writer.to_yaml(file_path, self)
  end
end

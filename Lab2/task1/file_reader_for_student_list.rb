# frozen_string_literal: true
require 'json'
require 'yaml'
require_relative 'Student'

class File_reader_for_student_list
  def from_txt(file_path, student_list)
    if File.exist?(file_path)
      file = File.new(file_path, "r:UTF-8")
      lines = file.read.to_s.strip
      cur_str = ""
      lines.each_char do |char|
        cur_str += char
        if char == '}'
          student_list.put_student(Student.from_json_str(cur_str))
          cur_str = ""
        end
      end
      file.close
    else
      raise ArgumentError, "file in path '#{file_path}' not found"
    end
  end

  def from_json(file_path, student_list)
    JSON.load(File.open(file_path)).each do |hash_for_student|
      student_list.put_student(Student.new(hash_for_student))
    end
  end

  def from_yaml(file_path, student_list)
    YAML.load(File.read(file_path)).each do |hash_for_student|
      student_list.put_student(Student.new(hash_for_student))
    end
  end
end

require 'json'
require 'yaml'
require_relative 'Student_models/Student'
require_relative 'Student_models/Student_short'
require_relative 'Lists_models/data_table'
require_relative 'Lists_models/student_list_json'
require_relative 'Lists_models/student_list_txt'
require_relative 'Lists_models/student_list_db'
require_relative 'Lists_models/student_list_file'
require_relative 'Lists_models/student_list_yaml'
require_relative 'database/class/database_worker'
require_relative 'Lists_models/student_list'
require_relative 'Lists_models/student_list_data_worker'
require_relative 'Lists_models/student_list_file_adapter'
require_relative 'Student_models/student_randomizer'
require 'mysql2'
require 'fox16'
include Fox


# test_list = Student_list.new(Student_list_DB.new(YAML.load(File.open('database/config/connect_db_hash.yaml'))))
# puts test_list.get_student_by_id(1)
# puts test_list.get_k_n_student_short_list(1,4).list
#
#
# a = Student_randomizer.new.generate_student
# puts a
# test_list.replace_by_id(5,a)
# puts test_list.get_student_by_id(5)
# puts test_list.get_students_count
#
# test_list2 = Student_list.new(Student_list_file_adapter.new(Student_list_JSON.new, 'result_files/input.json'))
# puts test_list2.get_k_n_student_short_list(20,3).list

puts 'Йажавид В. В.'.include?('З')
#k-длина списка n-пачка посчету
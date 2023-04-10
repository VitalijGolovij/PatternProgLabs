require 'json'
require 'yaml'
require_relative 'Student_models/Student'
require_relative 'Student_models/Student_short'
require_relative 'Lists_models/data_table'
require_relative 'Lists_models/student_list_json'
require_relative 'Lists_models/student_list_txt'
require_relative 'Lists_models/student_list_db'
require_relative 'Lists_models/student_list'
require_relative 'Lists_models/student_list_yaml'
require_relative 'database/class/database_worker'
require 'mysql2'

a = Student_list.new(Student_list_JSON.new)

a.read_from_file('result_files/input.json')

a.set_file_worker(Student_list_YAML.new)

a.write_to_file('result_files/output.yaml')

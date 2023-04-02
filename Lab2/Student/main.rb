require 'json'
require 'yaml'
require_relative 'Student_models/Student'
require_relative 'Student_models/Student_short'
require_relative 'Lists_models/data_table'
require_relative 'Lists_models/student_list_json'
require_relative 'Lists_models/student_list_txt'
require 'mysql2'

list_json = Student_list.new(Student_list_JSON.new)
list_json.read_from_file('result_files/input.json')
puts list_json.list
list_json.write_to_file('result_files/output.json')

# client = Mysql2::Client.new(:host => 'localhost', :username => 'vitalijg', :password => '1111')
# puts client.query('USE test')
# client.query('SELECT * FROM test_table').each do |res|
#   puts res.class
# end
require 'json'
require 'yaml'
require_relative 'Student_models/Student'
require_relative 'Student_models/Student_short'
require_relative 'Lists_models/data_table'
require_relative 'Lists_models/student_list_json'
require_relative 'Lists_models/student_list_txt'
require 'mysql2'

client = Mysql2::Client.new(YAML.load(File.open('database/config/connect_db_hash.yaml')))
client.query(File.read('database/scripts/create.sql'))
client.query(File.read('database/scripts/insert.sql'))

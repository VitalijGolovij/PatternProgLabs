require 'json'
require File.expand_path(File.dirname(__FILE__) + '/Student.rb')
require File.expand_path(File.dirname(__FILE__) + '/Student_short.rb')

l = Student.read_from_txt('input.txt')

puts l
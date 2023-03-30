# frozen_string_literal: true

class File_writer_for_student_list
  def to_txt(file_path, student_list)
    file = File.new(file_path, 'w')
    student_list.list.each do |student|
      file.write("#{student}\n")
    end
    file.close
  end

  def to_json(file_path, student_list)
    student_hash_list = []
    student_list.list.each{ |student| student_hash_list.append(student.to_hash) }
    File.open(file_path,'w') do |file|
      JSON.dump(student_hash_list,file)
    end
  end

  def to_yaml(file_path, student_list)
    student_hash_list = []
    student_list.list.each{ |student| student_hash_list.append(student.to_hash) }
    File.write(file_path, YAML.dump(student_hash_list))
  end
end

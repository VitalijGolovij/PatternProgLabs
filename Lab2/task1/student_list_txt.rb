# frozen_string_literal: true

class Student_list_txt
  def initialize(txt_file_path)
    @student_list = []
    @id_counter = 1
    Student.read_from_txt(txt_file_path).each { |student| put_student(student) }
  end

  def write_to_txt(file_path)
    Student.write_to_txt(@student_list, file_path)
  end

  def get_student_by_id(id)
    @student_list.find{ |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n, data_list = nil)

    if data_list
      raise ArgumentError, "overflow indexes" if data_list.list.size < k * (n - 1) + 1
      Data_list.new(data_list.list[k * (n - 1), k])
    else
      raise ArgumentError, "overflow indexes" if @student_list.size < k * (n - 1) + 1
      Data_list.new(@student_list[k * (n - 1), k].map { |student| Student_short.from_student(student) } )
    end
  end

  def sort_by_shortname
    @student_list.sort_by! { |student | student.shortname }
  end

  def put_student(student, index = @student_list.size)
    raise ArgumentError, "arg must be Student" unless student.class == Student

    student.id = @id_counter
    @student_list[index] = student
    @id_counter += 1
  end

  def replace_by_id(id, student)
    replace_index = @student_list.find_index{|old_student| old_student.id == id}
    put_student(student, replace_index)
  end

  def drop_by_id(id)
    @student_list.delete_if {|student| student.id == id}
  end

  def get_student_short_count
    @student_list.size
  end
end

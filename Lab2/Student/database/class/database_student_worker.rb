# frozen_string_literal: true
require 'mysql2'

class Database_student_worker
  def initialize(options={})
    @db_client = Mysql2::Client.new(options)
  end

  #вернуть результат запроса в виде Array
  protected def query_to_student_list(sql_query)
    student_list = []
    @db_client.query(sql_query).each do |row|
      student_list << Student.new(row)
    end
    student_list
  end

  def select_all
    query_to_student_list("SELECT * FROM students")
  end

  def select_by_id(id)
    query_to_student_list("SELECT * FROM students WHERE id=#{id}")[0]
  end

  def insert_student(args)
    @db_client.query("INSERT INTO students(surname, name, patronymic, phone, telegram, mail, git) VALUES
		(#{args['surname']}, #{args['name']}, #{args['patronymic']},
    #{args['phone']}, #{args['telegram']}, #{args['mail']}, #{args['git']})")
  end

  def delete_by_id(id)
    @db_client.query("DELETE FROM students WHERE id = #{id}")
  end

  def update_by_id(id, args)
    @db_client.query("UPDATE students SET surname=#{args['surname']}, name = #{args['name']},
            patronymic=#{args['patronymic']}, phone=#{args['phone']},
            telegram=#{args['telegram']}, mail=#{args['mail']}, git=#{args['git']}
            WHERE id=#{id}")
  end

end

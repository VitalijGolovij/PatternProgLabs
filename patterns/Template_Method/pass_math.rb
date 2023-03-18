# frozen_string_literal: true
require_relative 'pass_lab'

class Pass_math < Pass_lab
  def show_homework
    puts "Показал задания в тетрадке"
  end

  def get_grade
    puts "Получил плюсик"
  end
end
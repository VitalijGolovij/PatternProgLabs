# frozen_string_literal: true
class Pass_lab
  def pass
    come_to_class
    come_to_teacher
    show_homework
    answer_questions
    get_grade
  end

  def come_to_class
    puts "Зашёл в аудиторию"
  end

  def come_to_teacher
    puts "Подошёл к преподавателю"
  end

  def show_homework
    puts "Показал программу"
  end

  def answer_questions
    puts "Ответил на вопросы"
  end

  def get_grade
    puts "Получил оценку"
  end
end
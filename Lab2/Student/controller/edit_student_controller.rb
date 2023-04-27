# frozen_string_literal: true
require_relative 'student_window_controller'

class Edit_student_controller < Student_window_controller
  def initialize(view, student)
    @view = view
    @student = student
    set_textfields
  end

  def accept_student
    if check_valid
      new_student = Student.new(get_student_hash)
      @view.owner.controller.student_list.replace_by_id(@student.id, new_student)
      @view.owner.controller.refresh_data
      @view.close
    else
      @view.ok_button.state = STATE_DOWN
    end
  end

  protected
  def set_textfields
    @view.name_field.text = @student.name
    @view.surname_field.text = @student.surname
    @view.patronymic_field.text = @student.patronymic
    @view.git_field.text = @student.git
    @view.phone_field.text = @student.phone
    @view.mail_field.text = @student.mail
    @view.telegram_field.text = @student.telegram
  end
end

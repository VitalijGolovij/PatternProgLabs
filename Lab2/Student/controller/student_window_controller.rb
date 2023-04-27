# frozen_string_literal: true

class Student_window_controller
  def initialize(view)
    @view = view
  end

  def accept_student

  end

  def change_button_state
    if check_valid
      @view.ok_button.state = STATE_UP
    else
      @view.ok_button.state = STATE_DOWN
    end
  end

  def check_valid
    return false unless Student.is_name?(@view.name_field.text)
    return false unless Student.is_name?(@view.surname_field.text)
    return false unless Student.is_name?(@view.patronymic_field.text)
    return false unless Student.is_git?(@view.git_field.text) or @view.git_field.text == ""
    return false unless Student.is_phone?(@view.phone_field.text) or @view.phone_field.text == ""
    return false unless Student.is_mail?(@view.mail_field.text) or @view.mail_field.text == ""
    return false unless Student.is_telegram?(@view.telegram_field.text) or @view.telegram_field.text == ""
    true
  end

  def get_student_hash
    {
      "name": @view.name_field.text,
      "surname": @view.surname_field.text,
      "patronymic": @view.patronymic_field.text,
      "git": @view.git_field.text == ''? nil : @view.git_field.text,
      "phone": @view.phone_field.text == ''? nil : @view.phone_field.text,
      "mail": @view.mail_field.text == ''? nil : @view.mail_field.text,
      "telegram": @view.telegram_field.text == ''? nil : @view.telegram_field.text
    }
  end
end

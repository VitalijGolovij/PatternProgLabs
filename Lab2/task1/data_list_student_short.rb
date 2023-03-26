# frozen_string_literal: true
require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list


  #переопределили 1ый метод шаблона
  #заполнили названия столбцов таблицы
  protected def get_names
    %w[
      number
      name
      contact
      git
    ]
  end

  #переопреелили 2ой метод шаблона
  protected def fill_row(object)
    [
      @list.index(object),
      object.name,
      object.contact,
      object.git
    ]
  end
end



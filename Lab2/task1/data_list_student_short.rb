# frozen_string_literal: true
require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list

  #переопределили 1ый метод шаблона
  #избавляемся от аттрибута id
  protected def get_names
    super - [:@id]
  end

  #переопреелили 2ой метод шаблона
  #в начало строки записываем порядковый номер
  protected def fill_row(attr_names, object)
    super.insert(0, @list.index(object))
  end
end



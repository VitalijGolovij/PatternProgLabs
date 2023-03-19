# frozen_string_literal: true

class Data_list
  def initialize(objects_list)
    self.list = objects_list
    @selected = []
  end

  def select(number)
    raise ArgumentError, "arg 'number' not Integer" if number.class != Integer
    raise ArgumentError, "arg 'number' must be greater than zero" if number < 0
    raise ArgumentError, "index #{number} out of range" if number > @list.size - 1

    @selected << number unless @selected.include?(number)
  end

  def get_selected
    @selected
  end

  def list=(other)
    raise ArgumentError, "arg 'objects_list' must be Array" if other.class != Array
    @list = other
  end

  #основной метод, возвращающий Data_table
  def get_data
    Data_table.new(fill_table(get_names, @list))
  end

  protected
  #метод шаблона 1 - вернуть имена аттрибутов
  def get_names
    @list[0].instance_variables
  end

  #метод шаблона 2 - заполнить строку для таблицы
  def fill_row(attr_names, object)
    row = []
    attr_names.each{ |attr_name| row << object.instance_variable_get(attr_name) }
    row
  end

  #метод шаблона 3 - заполнить таблицу
  def fill_table(attr_names, objects_list)
    table = []
    objects_list.each{ |object| table << fill_row(attr_names, object) }
    table
  end
end

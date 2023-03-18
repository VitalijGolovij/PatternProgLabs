# frozen_string_literal: true

class Data_list
  def initialize(objects_list)
    @list = objects_list
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

  def get_names

  end

  def get_data

  end
end

# frozen_string_literal: true

class Data_list
  def initialize(object)
    @list = []
    object.instance_variables.each do |attr|
      @list << object.instance_variable_get(attr)
    end
  end
end


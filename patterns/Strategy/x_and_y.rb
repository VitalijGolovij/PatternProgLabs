# frozen_string_literal: true
require_relative 'strategy'
require_relative 'sum'
require_relative 'mult'
require_relative 'div'


class X_and_Y
  attr_accessor :x, :y

  def initialize(x, y, operation)
    self.x = x
    self.y = y

    #создаем объект класса стратегии для использования
    #его методов
    @operation = operation
  end

  def set_operation(operation)
    @operation = operation
  end

  #метод, который в каждом наследнике должен отличаться
  def calc
    @operation.calc(self)
  end
end

x_and_y = X_and_Y.new(1,2, Sum.new)
puts x_and_y.calc
# frozen_string_literal: true
require_relative 'operations'

#суперкласс
class X_and_Y
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y

    #создаем объект класса стратегии для использования
    #его методов
    @operation = Operations.new
  end

  #метод, который в каждом наследнике должен отличаться
  def calc
    @operation.addition(self)
  end
end

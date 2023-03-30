# frozen_string_literal: true
require_relative 'x_and_y'

class X1_and_Y1 < X_and_Y
  def calc
    @operation.subtraction(self)
  end
end
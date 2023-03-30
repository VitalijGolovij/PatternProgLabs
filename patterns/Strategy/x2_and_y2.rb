# frozen_string_literal: true
require_relative 'x_and_y'

class X2_and_Y2 < X_and_Y
  def calc
    @operation.multiplication(self)
  end
end

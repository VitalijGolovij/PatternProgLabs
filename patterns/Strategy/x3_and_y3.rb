# frozen_string_literal: true
require_relative 'x_and_y'

class X3_and_Y3 < X_and_Y
  def calc
    @operation.division(self)
  end
end

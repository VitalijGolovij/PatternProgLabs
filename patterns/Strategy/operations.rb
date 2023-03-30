# frozen_string_literal: true

#класс стратегии

class Operations

  def addition(ins)
    ins.x + ins.y
  end

  def subtraction(ins)
    ins.x - ins.y
  end

  def multiplication(ins)
    ins.x * ins.y
  end

  def division(ins)
    ins.x / ins.y
  end
end

# frozen_string_literal: true
require_relative 'strategy'

class Mult < Strategy
  def mult(inst)
    inst.x * inst.y
  end
end

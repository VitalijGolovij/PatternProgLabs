# frozen_string_literal: true
require_relative 'strategy'

class Sum < Strategy
  def calc(inst)
    inst.x + inst.y
  end
end

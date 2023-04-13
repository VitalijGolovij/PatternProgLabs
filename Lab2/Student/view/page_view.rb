# frozen_string_literal: true
require 'fox16'
include Fox
class Page_view < FXMatrix
  def initialize(parent)
    super(parent, :opts => LAYOUT_FILL)
  end
end

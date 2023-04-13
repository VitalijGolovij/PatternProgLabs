# frozen_string_literal: true
require 'fox16'
include Fox
class Page_list_view < FXList
  attr_reader :page_list

  def initialize(parent, opts, page_list)
    super(parent, :opts => opts)
    @page_list = page_list
  end


end

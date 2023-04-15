# frozen_string_literal: true
require_relative 'page'
require 'fox16'
include Fox

class Page_students < Page
  attr_reader :parameters_combobox
  def initialize(parent)
    super(parent, 'students list')
    @parameters_combobox = Hash.new
    # hFrame1 = FXHorizontalFrame.new(self)
    # chrLabel = FXLabel.new(hFrame1, "Number of characters in password:")
    # chrTextField = FXTextField.new(hFrame1, 4)
    #
    # hFrame2 = FXHorizontalFrame.new(self)
    # @includeSpecialCharacters = false
    # specialChrsCheck = FXCheckButton.new(hFrame2, "Include special chars in pass")
    #
    # vFrame1 = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)
    # textArea = FXText.new(vFrame1, :opts => LAYOUT_FILL | TEXT_READONLY | TEXT_WORDWRAP)
    # hFrame3 = FXHorizontalFrame.new(vFrame1)
    # generateButton = FXButton.new(hFrame3, "Generate")
    # copyButton = FXButton.new(hFrame3, "Copy to clipboard")


    # @splitter = FXSplitter.new(self,:opts=>HORIZONTAL_SPLITTER|LAYOUT_FILL)
    main_frame = FXHorizontalFrame.new(self, :opts => LAYOUT_FILL)
    make_filter_area(main_frame)
    make_table_area(main_frame)
    make_manage_buttons(main_frame)
  end

  protected
  def make_filter_area(parent)
    v_frame_filter = FXVerticalFrame.new(parent)
    FXLabel.new(v_frame_filter, "shortname:")
    FXTextField.new(v_frame_filter,15)
    make_parameter_filter(v_frame_filter, 'git')
    make_parameter_filter(v_frame_filter,'mail')
    make_parameter_filter(v_frame_filter,'phone')
    make_parameter_filter(v_frame_filter,'telegram')
  end

  def make_parameter_filter(parent, parameter_name)
    FXLabel.new(parent,"#{parameter_name}:")
    combo_box = FXComboBox.new(parent,1,:opts => COMBOBOX_STATIC|LAYOUT_LEFT)

    git_field = FXTextField.new(parent,15, :opts => LAYOUT_SIDE_LEFT)
    git_field.disable

    combo_box.fillItems(['doesn\'t matter', 'yes', 'no'])
    combo_box.numVisible = 3
    combo_box.connect(SEL_COMMAND) do
      if combo_box.currentItem == 1
        git_field.enable
      else
        git_field.disable
      end
    end
    @parameters_combobox[parameter_name] = combo_box
  end

  def make_table_area(parent)
    v_frame_table = FXVerticalFrame.new(parent)
    table = FXTable.new(v_frame_table, :opts => LAYOUT_EXPLICIT, :width => 450, :height => 600)
  end

  def make_manage_buttons(parent)
    v_frame = FXVerticalFrame.new(parent, :opts => LAYOUT_FILL | PACK_UNIFORM_WIDTH)
    add_button = FXButton.new(v_frame, 'Add')
    edit_button = FXButton.new(v_frame, 'Edit')
    delete_button = FXButton.new(v_frame, 'Delete')
  end
end

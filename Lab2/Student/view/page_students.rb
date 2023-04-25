# frozen_string_literal: true
require_relative 'page'
require_relative '../Lists_models/student_list_file'
require_relative '../Lists_models/student_list_json'
require_relative '../controller/student_list_controller'
require 'fox16'
include Fox

class Page_students < Page
  attr_reader :parameters_combobox, :table, :pages_count,
              :controller
  def initialize(parent)
    super(parent, 'students list')
    @parameters_combobox = Hash.new

    main_frame = FXHorizontalFrame.new(self, :opts => LAYOUT_FILL)
    make_filter_area(main_frame)
    make_table_area(main_frame)
    make_manage_buttons(main_frame)

    @controller = Student_list_controller.new(self)
    @controller.refresh_data
  end

  def set_table_data(data_table)
    (0..data_table.rows_count-1).each do |i|
      (0..data_table.columns_count-1).each do |j|
        @table.setItemText(i,j,data_table.get_elem(i,j).to_s)
      end
    end
  end

  def set_table_params(column_names, whole_entities_count)
    @table.setTableSize(whole_entities_count,column_names.size)

    0.upto(column_names.size - 1) do |i|
      @table.setColumnText(i, column_names[i])
      @table.setColumnWidth(i, 180)
    end
    @table.setColumnWidth(0,60)
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
    table_packer = FXPacker.new(v_frame_table)
    @table = FXTable.new(table_packer, :opts => LAYOUT_EXPLICIT, :width => 701, :height => 422)
    buttons_packer = FXPacker.new(v_frame_table, :opts => LAYOUT_FILL)
    hframe = FXHorizontalFrame.new(buttons_packer,
                                   :opts => LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X)
    next_button = FXButton.new(hframe, ">" ,
                               :opts => BUTTON_NORMAL|LAYOUT_RIGHT)
    next_button.connect(SEL_COMMAND) do
      @controller.next_page
    end
    prev_button = FXButton.new(hframe, "<" ,
                               :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    prev_button.connect(SEL_COMMAND) do
      @controller.prev_page
    end
    @pages_count = FXLabel.new(hframe, "",
                              :opts=> LAYOUT_CENTER_X)
  end

  def make_manage_buttons(parent)
    v_frame = FXVerticalFrame.new(parent, :opts => LAYOUT_FILL | PACK_UNIFORM_WIDTH)
    add_button = FXButton.new(v_frame, 'Add')
    add_button.connect(SEL_COMMAND) do
      @controller.add_student
    end
    edit_button = FXButton.new(v_frame, 'Edit')
    delete_button = FXButton.new(v_frame, 'Delete')
  end
end


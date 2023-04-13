# frozen_string_literal: true
require 'fox16'
require_relative 'page_list_view'
include Fox

class Main_window < FXMainWindow
  def initialize(app)
    super(app, "Student Book", :width => 800, :height => 600)
    add_menu_bar
    @page_list_view = Page_list_view.new(self, LAYOUT_FILL_Y|LAYOUT_SIDE_LEFT, [])
  end

  def add_menu_bar
    menu_bar = FXMenuBar.new(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)
    file_menu = FXMenuPane.new(self)
    FXMenuTitle.new(menu_bar, "File", :popupMenu => file_menu)
    import_cmd = FXMenuCommand.new(file_menu, "Import..." )
    import_cmd.connect(SEL_COMMAND) do
      dialog = FXFileDialog.new(self, "Import Photos" )
      dialog.selectMode = SELECTFILE_MULTIPLE
      dialog.patternList = ["Source (*.json, *.yaml, *.txt)" ]
      if dialog.execute != 0
        import_students(dialog.filenames)
      end
    end
    exit_cmd = FXMenuCommand.new(file_menu, "Exit" )
    exit_cmd.connect(SEL_COMMAND) do
      exit
    end
  end

  def import_students(filenames)

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $0
  FXApp.new do |app|
    Main_window.new(app)
    app.create
    app.run
  end
end
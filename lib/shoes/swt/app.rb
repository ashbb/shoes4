module Shoes::Swt::App
  def gui_init
    @shell = Swt::Widgets::Shell.new Swt::Widgets::Display.new
  end
    
  attr_reader :shell
    
  def gui_open
    # bla bla bla
  end
end

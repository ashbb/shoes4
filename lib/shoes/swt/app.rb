class Shoes::Swt::App
  def initialize
    @shell = Swt::Widgets::Shell.new Shoes.display
  end
    
  attr_reader :shell
    
  def open
    # bla bla bla
  end
end

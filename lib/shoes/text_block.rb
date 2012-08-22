require 'shoes/common_methods'

module Shoes
  class TextBlock
    include Shoes::CommonMethods

    attr_reader  :gui, :parent, :text
    attr_accessor :font_size, :width, :height, :left, :top

    def initialize(parent, klass, text, font_size, opts = {})
      @parent = parent
      @app = opts[:app]
      @font_size = font_size
      @text = text

      @gui = Shoes.configuration.backend_for(self, opts)
      @parent.add_child self
    end
    
    alias :_positioning :positioning
    
    def positioning x, y, max
      @width = (@left.to_i + @parent.width <= @app.width) ? @parent.width : @app.width - @left.to_i
      @height = @gui.get_height
      _positioning x, y, max
    end
  end
  
  class Para < TextBlock; end
end

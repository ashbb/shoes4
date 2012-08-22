module Shoes
  module Swt
    class TextBlock
      include Common::Move

      def initialize(dsl, opts = nil)
        @dsl = dsl
        @container = opts[:app].gui.real
        @container.addPaintListener(TbPainter.new(@dsl))
      end

      alias :_move :move

      def move x, y
        @left, @top, @width, @height = @dsl.left, @dsl.top, @dsl.width, @dsl.height
        _move x, y
      end
      
      def get_height
        tl = ::Swt::TextLayout.new Shoes.display
        tl.setText @dsl.text
        tl.setWidth @dsl.width
        tl.getBounds(0, @dsl.text.length - 1).height
      end

      private

      class TbPainter
        include Common::Resource

        def initialize(dsl)
          @dsl = dsl
          @tl = ::Swt::TextLayout.new Shoes.display
        end

        def paintControl(paint_event)
          gc = paint_event.gc
          gcs_reset gc
          @tl.setText @dsl.text
          @tl.setWidth @dsl.width
          @tl.draw gc, @dsl.left, @dsl.top
        end
      end
    end
    
    class Para < TextBlock; end
  end
end

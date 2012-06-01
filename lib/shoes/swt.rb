require 'java'
require 'swt'

module Shoes
  module Swt; end
  def self.display
    @display ||= ::Swt::Widgets::Display.new
  end
end

require 'shoes/swt/app'
require 'shoes/swt/check'


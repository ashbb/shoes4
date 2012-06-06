require 'spec/learn_spec_helper'

describe Shoes::App do
  describe 'initialize' do
    before do
      Shoes::App.any_instance.stub(:gui_open)
      @app = Shoes.app{}
    end
    
    it "should set accessor :width" do
      @app.should respond_to :width
    end
    
    it "should set default value - window's width is 600" do
      @app.width.should == 600
    end
  end
end

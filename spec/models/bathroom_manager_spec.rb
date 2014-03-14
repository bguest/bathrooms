require 'spec_helper'

describe BathroomManager do
  describe '#update_sign' do
    it "should push out new pixels" do
      br0 = Bathroom.new(position:1, name:'Gals', occupied:true, leds_count:2)
      br1 = Bathroom.new(position:0, name:'Guys', occupied:false, leds_count:1)

      BathroomManager.expects(:to_piper).with([0,128,0,255,0,0,255,0,0])
      BathroomManager.new([br0,br1]).update_sign
      BathroomManager.pixels.should == [Color::RGB::Green, Color::RGB::Red, Color::RGB::Red]
    end
  end
end

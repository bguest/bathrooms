require 'spec_helper'

describe Effects::HueFade do

  let(:sign){Sign.new(letter_order:[0], phrase:'(')}

  describe '#run' do
    before :each do
      LedString.new.add_sign(sign)
      [10,180].each do |clk|
        @options = {sign: sign, clock:clk, needs_update:false}
        Effects::Scrolling.run(@options)
        Effects::HueFade.run(@options)
      end
    end

    it 'should need update' do
      @options[:needs_update].should == true
    end

    it 'should set on segments the correct hue' do
      [5,12].each do |n|
        LedString.segments[n].color.should == Color::HSL.new(180,100,50)
      end
    end

    it 'should not change the background color' do
      ((0..15).to_a - [5,12]).each do |n|
        LedString.segments[n].color.should == nil
      end
    end
  end

end

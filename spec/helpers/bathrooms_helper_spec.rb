require 'spec_helper'

describe BathroomsHelper do

  describe '#bathroom_occupied_color' do
    it 'should return occupied color in html' do
      br = Bathroom.new(:occupied_color => Color::RGB::Green)
      helper.bathroom_occupied_color(br).should == '#008000'
    end

    it 'should return blank if no occupied color' do
      sign = stub(:occupied_color => nil)
      helper.bathroom_occupied_color(sign).should == ''
    end
  end

  describe '#bathroom_open_color' do
    it 'should return open color in html' do
      br = Bathroom.new(:open_color => Color::RGB::Green)
      helper.bathroom_open_color(br).should == '#008000'
    end

    it 'should return blank if no open color' do
      sign = stub(:open_color => nil)
      helper.bathroom_open_color(sign).should == ''
    end
  end
end

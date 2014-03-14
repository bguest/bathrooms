# == Schema Information
#
# Table name: bathrooms
#
#  id             :integer          not null, primary key
#  position       :integer
#  gpio_pin       :integer
#  occupied       :boolean
#  leds_count     :integer
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  occupied_color :string(255)
#  open_color     :string(255)
#
# Indexes
#
#  index_bathrooms_on_position  (position)
#

require 'spec_helper'

describe Bathroom do
  describe 'relations and properties' do
    it{ should serialize(:occupied_color).as ColorSerializer }
    it{ should serialize(:open_color).as ColorSerializer }
  end

  describe '#occupied_color' do
    it 'should default to Color::RGB::Green' do
      Bathroom.new.occupied_color.should == Color::RGB::Red
    end
  end

  describe '#open_color' do
    it 'should default to Color::RGB::Green' do
      Bathroom.new.open_color.should == Color::RGB::Green
    end
  end

  describe '#pixels' do
    it 'should return red pixels if bathroom is occupied' do
      br = Bathroom.new(leds_count:2, occupied:true)
      br.pixels.should == [Color::RGB::Red, Color::RGB::Red]
    end

    it 'should return green pixels if bathroom is occupied' do
      br = Bathroom.new(leds_count:2, occupied:false)
      br.pixels.should == [Color::RGB::Green, Color::RGB::Green]
    end
  end

  describe 'occupied=' do
    it 'Bathroom should need update after value is changed' do
      br = Bathroom.new(leds_count:2, occupied:true)
      br.occupied = false
      br.needs_update.should == true
    end
  end
end

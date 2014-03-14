# == Schema Information
#
# Table name: bathrooms
#
#  id         :integer          not null, primary key
#  position   :integer
#  gpio_pin   :integer
#  occupied   :boolean
#  leds_count :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_bathrooms_on_position  (position)
#

require 'spec_helper'

describe Bathroom do
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

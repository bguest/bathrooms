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

class Bathroom < ActiveRecord::Base

  attr_accessor :needs_update

  def pixels
    color = occupied ? Color::RGB::Red : Color::RGB::Green
    [color]*leds_count
  end

  def occupied=(ocupado)
    old = self.occupied
    super ocupado
    self.needs_update = old != self.occupied
  end

  def watch
    BathroomManager.watch(self)
  end
end


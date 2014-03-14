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

class Bathroom < ActiveRecord::Base
  after_initialize :init

  attr_accessor :needs_update

  serialize :occupied_color, ColorSerializer
  serialize :open_color, ColorSerializer

  def init
    self.occupied_color ||= Color::RGB::Red
    self.open_color ||= Color::RGB::Green
  end

  #def occupied_color
    #super || Color::RGB::Red
  #end

  #def open_color
    #super || Color::RGB::Green
  #end

  def pixels
    color = occupied ? occupied_color : open_color
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


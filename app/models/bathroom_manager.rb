class Color::RGB
  def to_a
    [red.to_i, green.to_i, blue.to_i]
  end
end

class Color::HSL
  def to_a
    rgb = self.to_rgb
    [rgb.red.to_i, rgb.green.to_i, rgb.blue.to_i]
  end
end

module BathroomManager
  extend self

  attr_accessor :pixels, :bathrooms

  def new(bathrooms = nil)
    bms = bathrooms || Bathroom.order(position: :asc)
    @bathrooms = Array(bms)
    @pixels = []
    self
  end

  def update_sign
    new if bathrooms.nil? || bathrooms.size == 0
    @pixels = bathrooms.sort_by{|br| br.position}.collect(&:pixels).flatten
    self.push!
  end

  def watch(bathroom)
    @threads ||= {}
    Thread.kill(@threads[bathroom.id]) if @threads[bathroom.id]
    @threads[bathroom.id] = PiPiper.watch :pin => bathroom.gpio_pin do
      ActiveRecord::Base.connection_pool.with_connection do
        Rails.logger.info "Pin #{bathroom.gpio_pin} Changed from #{last_value} to #{value}"
        bathroom.occupied = value
        bathroom.save
        BathroomManager.update_sign
      end
    end
  end

  def to_a
    @pixels.collect(&:to_a).flatten
  end

  def push!
    array = self.to_a
    to_piper(array)
    @bathrooms = nil
  end

  def to_piper(array)
    #PiPiper::Spi.begin do
      #write array
    #end
    PiPiper::Spi.spidev_out(array)
  end
end

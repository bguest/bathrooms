module BathroomsHelper
  def bathroom_occupied_color(bathroom)
    bathroom.occupied_color ? bathroom.occupied_color.html : ''
  end

  def bathroom_open_color(bathroom)
    bathroom.open_color ? bathroom.open_color.html : ''
  end
end

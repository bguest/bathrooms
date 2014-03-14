class BathroomsController < ApplicationController
  def index
    @bathrooms = Bathroom.order(position: :asc)
  end

  def admin
    @bathrooms = Bathroom.order(position: :asc)
  end

  #PATCH /bathrooms/:id(.:format)
  def update
    bathroom = Bathroom.find(params[:id])

    br_params = bathroom_params
    br_params[:open_color] = Color::RGB.from_html(bathroom_params[:open_color])
    br_params[:occupied_color] = Color::RGB.from_html(bathroom_params[:occupied_color])

    if bathroom.update_attributes(br_params)
      BathroomManager.update_sign if bathroom.needs_update
      flash[:success] = "#{bathroom.name} bathroom updated, needs update = #{bathroom.needs_update}"
      redirect_to admin_bathrooms_path
    else
      flash[:error] = "Error updating #{bathroom.name} bathroom"
      render :admin
    end
  end

  #watch_bathroom PUT /bathrooms/:id/watch(.:format)
  def watch
    bathroom = Bathroom.find(params[:id])
    bathroom.watch
    flash[:success] = "#{bathroom.name} bathroom is being watched"
    redirect_to admin_bathrooms_path
  end

  private

  def bathroom_params
    params.require(:bathroom).permit(:name,
                                     :position,
                                     :gpio_pin,
                                     :occupied,
                                     :occupied_color,
                                     :open_color,
                                     :leds_count)
  end
end

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
    if bathroom.update_attributes(bathroom_params)
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
    params.require(:bathroom).permit(:name, :position, :gpio_pin, :occupied, :leds_count)
  end
end

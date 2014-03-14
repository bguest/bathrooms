class AddColorsToBathrooms < ActiveRecord::Migration
  def change
    add_column :bathrooms, :occupied_color, :string
    add_column :bathrooms, :open_color, :string
  end
end

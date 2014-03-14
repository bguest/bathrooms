class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.integer :position
      t.integer :gpio_pin
      t.boolean :occupied
      t.integer :leds_count
      t.string :name

      t.timestamps
    end
    add_index :bathrooms, :position
  end
end

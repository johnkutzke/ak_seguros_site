class CreateVehicleBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_brands do |t|
      t.string :brand

      t.timestamps
    end
  end
end

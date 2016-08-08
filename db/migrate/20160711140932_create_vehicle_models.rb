class CreateVehicleModels < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_models do |t|
      t.string :model
      t.references :vehicle_brand, foreign_key: true

      t.timestamps
    end
  end
end

class AddFuelToVehicleModels < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicle_models, :fuel, :string
  end
end

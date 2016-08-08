class AddPriceToVehicleModels < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicle_models, :price, :decimal
  end
end

class AddYearToVehicleModels < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicle_models, :year, :integer
  end
end

class CreateQuotations < ActiveRecord::Migration[5.0]
  def change
    create_table :quotations do |t|
      t.references :vehicle_model, foreign_key: true
      t.boolean :has_alarm
      t.boolean :has_blocker_ignition
      t.boolean :has_tracker
      t.boolean :funded_alienated
      t.boolean :has_armor
      t.boolean :has_gaskit
      t.boolean :has_chassis_remarked
      t.string :cep
      t.string :cep_night
      t.boolean :has_house_park
      t.boolean :has_house_remote_control
      t.boolean :use_go_work
      t.boolean :has_work_park
      t.boolean :has_work_remote_control
      t.boolean :use_commercial
      t.boolean :use_go_study
      t.boolean :has_study_park
      t.boolean :has_study_remote_control
      t.integer :km_daily
      t.integer :number
      t.string :contact_name
      t.string :contact_email
      t.references :insurance_type, foreign_key: true

      t.timestamps
    end
  end
end

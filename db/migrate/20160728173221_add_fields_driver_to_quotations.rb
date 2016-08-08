class AddFieldsDriverToQuotations < ActiveRecord::Migration[5.0]
  def change
    add_column :quotations, :driver_name, :string
    add_column :quotations, :driver_cpf, :string
    add_column :quotations, :driver_gender, :string
    add_column :quotations, :driver_birth_date, :date
    add_column :quotations, :driver_marital_status, :string
    add_column :quotations, :has_driver_dependent, :boolean
    add_column :quotations, :enabling_time, :integer
    add_column :quotations, :home_cep, :string
    add_column :quotations, :has_other_vehicles, :boolean
    add_column :quotations, :schooling, :string
    add_column :quotations, :professional_activity, :string
    add_column :quotations, :was_stolen, :boolean
    add_column :quotations, :driver_is_insured, :boolean
    add_column :quotations, :driver_is_owner, :boolean
  end
end

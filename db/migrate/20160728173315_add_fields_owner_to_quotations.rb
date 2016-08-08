class AddFieldsOwnerToQuotations < ActiveRecord::Migration[5.0]
  def change
    add_column :quotations, :owner_name, :string
    add_column :quotations, :owner_cpf, :string
    add_column :quotations, :owner_email, :string
    add_column :quotations, :owner_gender, :string
    add_column :quotations, :owner_birth_date, :date
    add_column :quotations, :owner_marital_status, :string
    add_column :quotations, :owner_is_driver, :boolean
  end
end

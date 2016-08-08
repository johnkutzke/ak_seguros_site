class AddFieldsInsuredToQuotations < ActiveRecord::Migration[5.0]
  def change
    add_column :quotations, :insured_name, :string
    add_column :quotations, :insured_cpf, :string
    add_column :quotations, :insured_email, :string
    add_column :quotations, :insured_gender, :string
    add_column :quotations, :insured_birth_date, :date
    add_column :quotations, :insured_marital_status, :string
    add_column :quotations, :insured_is_driver, :boolean
    add_column :quotations, :insured_is_owner, :boolean
  end
end
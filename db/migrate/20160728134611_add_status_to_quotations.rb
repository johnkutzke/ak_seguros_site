class AddStatusToQuotations < ActiveRecord::Migration[5.0]
  def change
    add_column :quotations, :status, :string
  end
end

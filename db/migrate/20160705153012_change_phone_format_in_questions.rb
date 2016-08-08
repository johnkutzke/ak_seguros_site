class ChangePhoneFormatInQuestions < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :phone, :string
  end
end

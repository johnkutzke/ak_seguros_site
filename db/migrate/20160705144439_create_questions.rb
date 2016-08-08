class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :integer
      t.text :message

      t.timestamps
    end
  end
end

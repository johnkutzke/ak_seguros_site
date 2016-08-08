class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :cpf
      t.string :gender
      t.date :birth_date
      t.string :email
      t.string :marital_status

      t.timestamps
    end
  end
end

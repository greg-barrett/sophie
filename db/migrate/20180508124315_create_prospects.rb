class CreateProspects < ActiveRecord::Migration[5.1]
  def change
    create_table :prospects do |t|
      t.string :title
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :phone_number
      t.text :message

      t.timestamps
    end
  end
end

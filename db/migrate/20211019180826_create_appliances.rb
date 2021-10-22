class CreateAppliances < ActiveRecord::Migration[6.1]
  def change
    create_table :appliances do |t|
      t.string :name
      t.integer :house_id
      t.integer :user_id

      t.timestamps
    end
  end
end

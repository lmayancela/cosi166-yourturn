# frozen_string_literal: true

class CreateAppliances < ActiveRecord::Migration[6.1]
  def change
    create_table :appliances do |t|
      t.string :name
      t.integer :house_id
      t.integer :user_id
      t.boolean :used
      t.timestamps
    end
  end
end

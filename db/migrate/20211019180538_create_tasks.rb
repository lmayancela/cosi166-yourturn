# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :priority
      t.integer :house_id
      t.date :due_date

      t.timestamps
    end
  end
end

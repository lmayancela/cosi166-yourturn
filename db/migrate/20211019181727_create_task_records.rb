# frozen_string_literal: true

class CreateTaskRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :task_records do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

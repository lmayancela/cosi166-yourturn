# frozen_string_literal: true

class CreateBillRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :bill_records do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

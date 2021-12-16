# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :user_name, null: false, default: 'guest'
      t.integer :house_id, null: false, default: 1
      t.string :body, null: false
      t.integer :likes_count, null: false, default: 0
      t.integer :reposts_count, null: false, default: 0

      t.timestamps
    end
  end
end

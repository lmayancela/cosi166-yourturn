class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.name :string
      t.email :string
      t.password :string
      t.house :references

      t.timestamps
    end
  end
end

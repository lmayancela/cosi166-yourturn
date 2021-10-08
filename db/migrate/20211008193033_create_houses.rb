class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.name :string
      t.user :references

      t.timestamps
    end
  end
end

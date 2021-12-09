class AddCreatorFieldToBills < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :creator_id, :string
  end
end

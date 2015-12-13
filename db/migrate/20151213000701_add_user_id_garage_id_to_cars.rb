class AddUserIdGarageIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :user_id, :integer
    add_column :cars, :garage_id, :integer
  end
end

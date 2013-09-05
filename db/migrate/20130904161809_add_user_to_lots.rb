class AddUserToLots < ActiveRecord::Migration
  def change
    change_column :searches, :user_id, :integer
    add_column :lots, :user_id, :integer
    remove_column :lots, :lot_id
  end
end

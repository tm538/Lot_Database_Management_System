class AddUserToLots < ActiveRecord::Migration
  def change
    add_column :lots, :user_id, :integer
  end
end

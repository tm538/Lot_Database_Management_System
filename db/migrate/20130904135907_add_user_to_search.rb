class AddUserToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :user_id, :integers
  end
  
end
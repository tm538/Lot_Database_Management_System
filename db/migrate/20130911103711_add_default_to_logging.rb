class AddDefaultToLogging < ActiveRecord::Migration
  def up
      change_column :versions, :whodunnit, :string, :default => "1"
  end
  
  def down
      change_column :versions, :whodunnit, :string, :default => nil
  end
end

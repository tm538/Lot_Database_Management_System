class AddRestrictionToLots < ActiveRecord::Migration
  def change
    add_column :lots, :restriction, :string
  end
end

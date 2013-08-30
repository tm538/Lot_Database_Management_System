class AddLotFields < ActiveRecord::Migration
  def change
    add_column :lots, :samp_id, :string
    add_column :lots, :region, :string
    add_column :lots, :site, :string
  end
end

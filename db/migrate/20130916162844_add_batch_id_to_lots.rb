class AddBatchIdToLots < ActiveRecord::Migration
  def change
    add_column :lots, :batch_id, :integer
  end
end

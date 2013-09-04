class LotsAddSampleId < ActiveRecord::Migration
  def change
    add_column :lots, :lot_id, :integers
    add_index :searches, [:id]
    
  end
end

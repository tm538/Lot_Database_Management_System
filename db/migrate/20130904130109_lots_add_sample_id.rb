class LotsAddSampleId < ActiveRecord::Migration
  def change
    add_index :searches, [:id]    
  end
end

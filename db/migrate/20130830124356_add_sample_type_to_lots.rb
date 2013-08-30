class AddSampleTypeToLots < ActiveRecord::Migration
  def change
    add_column :lots, :sampletype_id, :integer
    add_column :lots, :commonname_id, :integer
  end
end

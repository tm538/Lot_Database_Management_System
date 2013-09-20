class AddColumnExtraBatches < ActiveRecord::Migration
  def change
     add_column :batches, :extra, :text
  end
end

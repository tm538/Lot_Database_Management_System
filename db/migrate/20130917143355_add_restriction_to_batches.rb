class AddRestrictionToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :restriction, :string
  end
end

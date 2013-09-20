class Addcommercialtobatch < ActiveRecord::Migration
  def change
    add_column :batches, :commercial, :boolean
  end
end

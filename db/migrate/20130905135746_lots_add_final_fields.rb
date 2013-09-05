class LotsAddFinalFields < ActiveRecord::Migration
  def change
     add_column :lots, :returned, :string
     add_column :lots, :return_date, :datetime
     add_column :lots, :archive_box, :string
  end
end

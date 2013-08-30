class LotAddtionalFields < ActiveRecord::Migration
  def change
    add_column :lots, :data_entered_by, :integer
    add_column :lots, :extra_info, :text
    add_column :lots, :sample_form, :string
  end
end

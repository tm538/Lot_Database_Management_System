class Phylumclass2 < ActiveRecord::Migration
  def change
    add_column :lots, :phylum, :string

  end
end

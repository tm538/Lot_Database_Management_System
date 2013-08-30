class AddPhlyumClass < ActiveRecord::Migration
  def change
    add_column :lots, :genus, :string
    add_column :lots, :species, :string
  end
end

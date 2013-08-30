class AddLotsAnalysisBy < ActiveRecord::Migration
  def change
    add_column :lots, :analysis_by, :integer
    add_column :lots, :to_return, :string
  end
end

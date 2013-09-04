class Analysis < ActiveRecord::Migration
  def change
    add_column :lots, :isotopes, :boolean
    add_column :lots, :zooms, :boolean
    add_column :lots, :aar, :boolean
    add_column :lots, :lipid, :boolean
    add_column :lots, :dna, :boolean
    add_column :lots, :analysis_other, :string
  end
end

class Addlocationtolots < ActiveRecord::Migration
  def change
    add_column :lots, :town, :string
    add_column :lots, :Latitude, :string
    add_column :lots, :Longitude, :string
    add_column :lots, :county, :string
    add_column :lots, :district, :string
    add_column :lots, :parish, :string
    add_column :lots, :gisdataset, :string
  end
end

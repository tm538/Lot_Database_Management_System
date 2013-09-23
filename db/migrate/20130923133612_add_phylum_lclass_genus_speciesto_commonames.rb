class AddPhylumLclassGenusSpeciestoCommonames < ActiveRecord::Migration
  def change
    add_column :commonnames, :phylum, :string
    add_column :commonnames, :l_class, :string
    add_column :commonnames, :genus, :string
    add_column :commonnames, :species, :string
    add_column :commonnames, :hint, :boolean
  end
end

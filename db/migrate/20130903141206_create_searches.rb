class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :from
      t.integer :to
      t.integer :lot
      t.integer :client
      t.boolean :com
      t.string :site
      t.string :phylum
      t.string :l_class
      t.string :genus
      t.string :species

      t.timestamps
    end
  end
end

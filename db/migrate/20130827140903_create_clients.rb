class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :org
      t.text :address
      t.string :email
      t.text :extra

      t.timestamps
    end
  end
end

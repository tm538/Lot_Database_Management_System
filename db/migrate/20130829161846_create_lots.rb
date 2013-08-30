class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.integer :client_id
      t.boolean :commercial

      t.timestamps
    end
    add_index :lots, [:id]
  end
end

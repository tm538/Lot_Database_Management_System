class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.integer :client_id
      t.integer :user_id

      t.timestamps
    end
  end
end
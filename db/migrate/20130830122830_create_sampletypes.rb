class CreateSampletypes < ActiveRecord::Migration
  def change
    create_table :sampletypes do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreatePhylums < ActiveRecord::Migration
  def change
    create_table :phylums do |t|
      t.string :name

      t.timestamps
    end
  end
end

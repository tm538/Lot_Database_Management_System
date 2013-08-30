class CreateCommonnames < ActiveRecord::Migration
  def change
    create_table :commonnames do |t|

      t.string :name
      t.timestamps
    end
  end
end

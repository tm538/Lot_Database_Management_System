class CreateLClasses < ActiveRecord::Migration
  def change
    create_table :l_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end

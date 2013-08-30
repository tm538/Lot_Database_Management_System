class AddPhylumclass3 < ActiveRecord::Migration
  def change
        add_column :lots, :l_class, :string
  end
end

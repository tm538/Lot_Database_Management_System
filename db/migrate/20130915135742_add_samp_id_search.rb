class AddSampIdSearch < ActiveRecord::Migration
  def change
    add_column :searches, :samp_id, :string
  end
end

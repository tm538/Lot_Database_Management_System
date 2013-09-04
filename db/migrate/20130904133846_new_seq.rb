class NewSeq < ActiveRecord::Migration
  def change
        execute 'INSERT INTO sqlite_sequence (name, seq) VALUES("lot_id_seq", 20000);'
  end
end

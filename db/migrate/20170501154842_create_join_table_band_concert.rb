class CreateJoinTableBandConcert < ActiveRecord::Migration[5.0]
  def change
    create_join_table :bands, :concerts do |t|
      t.index [:band_id, :concert_id]
      
    end
  end
end

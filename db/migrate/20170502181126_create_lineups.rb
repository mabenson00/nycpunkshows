class CreateLineups < ActiveRecord::Migration[5.0]
  def change
    create_table :lineups do |t|
    	t.integer :concert_id
    	t.integer :band_id
    	t.integer :position
      t.timestamps
    end
  end
end

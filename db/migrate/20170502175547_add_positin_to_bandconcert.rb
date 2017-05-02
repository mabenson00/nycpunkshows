class AddPositinToBandconcert < ActiveRecord::Migration[5.0]
  def change
    add_column :bandconcerts, :position, :integer
  end
end

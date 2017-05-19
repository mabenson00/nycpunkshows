class AddBandcampToBand < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :bandcamp, :string
  end
end

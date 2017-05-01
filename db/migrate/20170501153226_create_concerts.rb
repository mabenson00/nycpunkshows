class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
    	t.date :date
    	t.string :time
    	t.belongs_to :venue, index: true
      t.timestamps
    end
  end
end

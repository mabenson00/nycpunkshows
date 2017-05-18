class Band < ApplicationRecord
	has_many :lineups
	has_many :concerts, :through => :lineups

	def future_concerts
		 shows = self.concerts.where("date >= ?", Date.today)
	end
	
	
end

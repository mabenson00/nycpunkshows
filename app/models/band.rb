class Band < ApplicationRecord
	has_many :lineups
	has_many :concerts, :through => :lineups

	
	
end

class Lineup < ApplicationRecord
	belongs_to :band
	belongs_to :concert
end

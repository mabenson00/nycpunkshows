class Band < ApplicationRecord
	has_and_belongs_to_many :concerts
end

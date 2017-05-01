class Concert < ApplicationRecord
	has_and_belongs_to_many :bands
	accepts_nested_attributes_for :bands, reject_if: lambda {|attributes| attributes['name'].blank?}
	belongs_to :venue
	accepts_nested_attributes_for :venue, reject_if: lambda {|attributes| attributes['name'].blank?}
	
	def autosave_associated_records_for_venue 
		if new_venue = Venue.find_by_name(venue.name)
			self.venue = new_venue
		else 
			self.venue.save!
			self.venue_id = self.venue.id
		end
	end
end

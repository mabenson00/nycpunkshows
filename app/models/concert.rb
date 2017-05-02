class Concert < ApplicationRecord
	has_and_belongs_to_many :bands
	accepts_nested_attributes_for :bands, reject_if: lambda {|attributes| attributes['name'].blank?}
	belongs_to :venue
	accepts_nested_attributes_for :venue, reject_if: lambda {|attributes| attributes['name'].blank?}
	
	def get_bands
		bands = []
			self.bands.each do |band|
				bands << band.name 
			end
		bands.join(", ")
	end
	def autosave_associated_records_for_venue 
		if new_venue = Venue.find_by_name(venue.name)
			self.venue = new_venue
		else 
			self.venue.save!
			self.venue_id = self.venue.id
		end
	end

	def autosave_associated_records_for_bands
		bands.length.times do |n|
			band=bands[n]
			new_band = Band.find_by_name(band.name)
			if new_band
				self.bands << new_band
			else
				band.save  
				self.bands << band
			end
		end
	end

end

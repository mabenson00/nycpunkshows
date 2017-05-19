require 'nokogiri'
require 'open-uri'
require 'openssl'

class Concert < ApplicationRecord
	has_many :lineups
	has_many :bands, :through => :lineups
	
	
	accepts_nested_attributes_for :bands, reject_if: lambda {|attributes| attributes['name'].blank?}
	belongs_to :venue
	accepts_nested_attributes_for :venue, reject_if: lambda {|attributes| attributes['name'].blank?}
	
	def get_bands
		bands = Band.select('bands.name', 'lineups.concert_id', 'lineups.id').joins(:lineups).where('lineups.concert_id' => self.id).order('lineups.id')
		print_bands =[]
			bands.each do |band|
				print_bands << band.name 
			end
			
		print_bands.join(", ")
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
				bandcamp=get_bandcamp(band.name)
				band.bandcamp=bandcamp
				band.save  
				self.bands << band
			end
		end
	end


		def get_bandcamp(band_name)
			url = "https://bandcamp.com/search?q=#{band_name}"			
			OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
			doc = Nokogiri::HTML open(url)
			link_url = doc.xpath('//*[@id="pgBd"]/div[1]/div[1]/div/ul/li[1]/div/div[2]/a/@href').first.value
			link_url = link_url[/^[^\?]*/]
		end

		
end

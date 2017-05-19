class Band < ApplicationRecord
	has_many :lineups
	has_many :concerts, :through => :lineups

	def future_concerts
		 shows = self.concerts.where("date >= ?", Date.today)
	end
	
	def get_old_bandcamps(band_name)
			url = "https://bandcamp.com/search?q=#{band_name}"			
			OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
			doc = Nokogiri::HTML open(url)
			link_url = doc.xpath('//*[@id="pgBd"]/div[1]/div[1]/div/ul/li[1]/div/div[2]/a/@href').first.value
			link_url = link_url[/^[^\?]*/]
		end
	
end

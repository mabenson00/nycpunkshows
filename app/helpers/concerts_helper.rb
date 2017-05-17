module ConcertsHelper
	def return_future(concerts)
		shows = concerts.select do |concert|
			concert.date >= Date.today
		end
		return shows
	end
end

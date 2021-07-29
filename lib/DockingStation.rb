require "./lib/Bike"


class DockingStation
	attr_reader :dock
	def initialize
		@dock = []
	end

	def release_bike
		raise "The dock is empty" if dock.empty?
		Bike.new
	end

	def dock_bike
		raise "The dock is full" if dock.count >= 10
		@dock.push(Bike.new)
	end

	def check
		if dock.empty?
			puts "No bikes, sorry"
		else
			dock
		end
	end

end
require "./lib/Bike"

class DockingStation
	attr_reader :dock
	def initialize
		@dock = []
	end

	def release_bike
		raise "The dock is empty" if empty?
		Bike.new
	end

	def dock_bike
		raise "The dock is full" if full?
		@dock.push(Bike.new)
	end

	def check
		"No bikes, sorry" if empty?
		dock
	end

	private
	
	def full?
		dock.count >= 20 ? true : false
	end

	def empty?
		dock.empty? ? true : false
	end

end
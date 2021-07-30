require "./lib/Bike"
DEFAULT_CAPACITY = 20

class DockingStation
	attr_reader :dock, :capacity

	def initialize(constant = DEFAULT_CAPACITY)
		@capacity = constant
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
		dock.count >= DEFAULT_CAPACITY ? true : false
	end

	def empty?
		dock.empty? ? true : false
	end

end
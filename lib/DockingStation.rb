require "./lib/Bike"

class DockingStation
	attr_reader :dock
    #DEFAULT_CAPACITY = 20

	def initialize(constant = 20)
		self.class.const_set(:DEFAULT_CAPACITY, constant)
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
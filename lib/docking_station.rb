require_relative './bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  
  def dock(bike)
    raise 'Docking station full' if full?
    bikes << bike
  end

  def release_bike
    raise 'No bikes available' if bikes.empty?
    bikes.pop
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end
end
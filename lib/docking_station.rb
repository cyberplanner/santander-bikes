require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise "Full capacity reached" if full?
    @bikes << bike
  end

  def release_bike
    fail 'no bikes available' if empty?
    @bikes.pop
  end

private
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end

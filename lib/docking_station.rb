require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def dock(bike)
    raise "Full capacity reached" if @bikes.length >= 20
    @bikes << bike
  end

  def release_bike
    fail 'no bikes available' if @bikes.empty?
    @bikes.pop
  end

end

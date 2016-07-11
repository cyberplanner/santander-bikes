require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def dock(bike)
    raise "Full capacity reached" if full?
    @bikes << bike

  end

  def release_bike
    fail 'no bikes available' if empty?
    #@bikes.pop
    bike = @bikes.last

    while @bikes.count > 0 do
      if bike.working?
        @bikes.pop

      else
        @broken_bikes << @bikes.pop
      end
    end

  end

private
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end

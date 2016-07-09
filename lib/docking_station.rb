require_relative 'bike'

class DockingStation
  

  def dock(bike)
    @bike= bike
  end

  attr_reader :bike
  
  def release_bike
    Bike.new
  end

end

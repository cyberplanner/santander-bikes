class Bike
  #attr_reader :working
  attr_reader :broken

  #def initialize
    #@working = true
  #end

  def working?
    true
  end

  def report_broken
    @broken = true
  end
  
  
  def broken?
    @broken
  end

end

require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike) }


  it "gets a bike" do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it "is working?" do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_working
  end

  it { expect(subject).to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it "docks something" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
    end

    it "Show docked bike " do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

  describe '#release_bike' do
    it "raises error" do
      expect { subject.release_bike }.to raise_error("no bikes available")
    end
  end

  it "only accepts station's capacity" do
    subject.class::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    expect{ subject.dock(Bike.new)}.to raise_error "Full capacity reached"
  end
### ASK ABOUT THIS
  #it "can set capacity" do
    #station= DockingStation.new(capacity)
    #expect(station.capacity).to eq capacity
  #end

  it "has default capacity" do
    expect(subject.capacity).to eq subject.class::DEFAULT_CAPACITY
  end

#### Another test similar to "Reports broken bike" in bike_spec 
  #it "report broken bike" do
    #bike = Bike.new
    #bike.report_broken
    #expect(bike.working?).to eq false
    #end

  end

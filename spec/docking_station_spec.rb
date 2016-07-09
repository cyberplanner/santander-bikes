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

end

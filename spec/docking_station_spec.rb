require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike) }
  it { expect(subject).to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bikes) }

  describe "#release_bike" do
    let(:bike) { double :bike }
    it "gets a bike" do
      allow(bike)
      subject.dock double(:bike)
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end

    let(:bike) { double :bike }
    it "releases working bikes?" do
      allow(bike).to receive(:working).and_return(true)
      subject.dock double(:bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it "raises error if docking station empty" do
      expect{ subject.release_bike }.to raise_error("no bikes available")
    end

  end

  it "docks something" do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
    end

    it "Show docked bike " do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end


  it "only accepts station's capacity" do
    subject.class::DEFAULT_CAPACITY.times {subject.dock double(:bike)}
    expect{ subject.dock double(:bike)}.to raise_error "Full capacity reached"
  end

  it "has default capacity" do
    expect(subject.capacity).to eq subject.class::DEFAULT_CAPACITY
  end


  it "does not release a broken bike" do
    bike = double(:bike)
    bike.report_broken
    subject.dock(bike)
    expect{ subject.release_bike }.to raise_error "no bikes available"
  end

  it "accepts bikes in any condetion" do
    bike = double(:bike)
    bike.report_broken
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
  end
end

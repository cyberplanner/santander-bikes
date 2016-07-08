require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike) }

  context "Gets a bike, expect bike to be working?" do
    it "gets a bike" do
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end

    it "bike working?" do
      expect(subject.release_bike).to be_working
    end

  end

end

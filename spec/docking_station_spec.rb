require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike) }


  it "gets a bike" do
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it "is working?" do
    expect(subject.release_bike).to be_working
  end


  it { expect(subject).to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
    end

  it "shows docks bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  

  







end

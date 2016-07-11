require 'bike'

describe Bike do
  it {expect(subject).to respond_to(:working?)}
  it {expect(subject).to respond_to(:report_broken)}

  it "Reports broken bike" do
    subject.report_broken
    expect(subject).to be_broken
    end
end

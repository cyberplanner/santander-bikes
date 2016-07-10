require 'bike'

describe Bike do
  it {expect(subject).to respond_to(:working?)}
  it {expect(subject).to respond_to(:report_broken)}
end

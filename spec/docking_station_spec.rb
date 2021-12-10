require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { expect(subject.release_bike).to be_a Bike }

  it "Releases a bike that is working" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to :dock }

end
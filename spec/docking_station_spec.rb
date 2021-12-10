require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { expect(subject.release_bike).to be_a Bike }
  
end
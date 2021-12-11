require 'docking_station'
require 'bike'

describe DockingStation do
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases a bike that is working' do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end 

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when full' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
  
  end
  
  describe '#bikes' do
    it { is_expected.to respond_to :bikes }
    
    it 'returns docked bikes' do
      bikes = []
      20.times { bikes << Bike.new }
      bikes.each { |bike| subject.dock bike }
      expect(subject.bikes).to eq bikes
    end
  end
end
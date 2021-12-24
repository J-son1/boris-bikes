require 'docking_station'
require 'bike'

describe DockingStation do
  subject(:station) { DockingStation.new }

  let(:bike) { double(:bike) }
  let(:dock_bike) { station.dock(bike) }    # Bike class

  it 'has a default capacity' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        station.dock(bike)    # Bike class
      end
      expect{ station.dock(bike) }.to raise_error 'Docking station full'    # Bike class
    end
    
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock bike }    # Bike class
      expect{ docking_station.dock bike }.to raise_error 'Docking station full'   # Bike class
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    context 'when a bike is not available' do
      it 'raises an error when there are no bikes available' do
        expect { station.release_bike }.to raise_error 'No bikes available'
      end

      it 'does not release broken bikes' do
        allow(bike).to receive(:report_broken)
        allow(bike).to receive(:broken?).and_return(true)
        bike.report_broken
        dock_bike
        expect { station.release_bike }.to raise_error 'Bike not available'
      end
    end

    context 'when a bike is available' do
      before { dock_bike }

      it 'releases a bike' do
        allow(bike).to receive(:broken?).and_return(false)
        expect(station.release_bike).to eq bike   # Bike class
      end

      it 'releases a working bike' do
        allow(bike).to receive(:broken?).and_return(false)
        allow(bike).to receive(:working?).and_return(true)
        bike = station.release_bike
        expect(bike).to be_working    # Bike class
      end
    end
  end 

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    context 'when full' do
      it 'raises an error' do
        station.capacity.times { station.dock Bike.new }    # Bike class
        expect { station.dock Bike.new }.to raise_error 'Docking station full'    # Bike class
      end
    end

    context 'when not full' do
      it 'docks a working bike' do
        expect(station.dock(bike)).to eq [bike]   # Bike class
      end

      it 'docks a broken bike' do
        allow(bike).to receive(:report_broken)
        bike.report_broken
        expect(station.dock(bike)).to eq [bike]   # Bike class
      end
    end
  end
end
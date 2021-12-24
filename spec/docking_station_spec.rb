require 'docking_station'
require 'bike'

describe DockingStation do
  subject(:station) { DockingStation.new }

  let(:bike) { double(:bike,
    report_broken: true,
    broken?: false,
  ) }
  let(:dock_bike) { station.dock(bike) }

  it 'has a default capacity' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        station.dock(bike)
      end
      expect{ station.dock(bike) }.to raise_error 'Docking station full'
    end
    
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock bike }
      expect{ docking_station.dock bike }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    context 'when a bike is not available' do
      it 'raises an error when there are no bikes available' do
        expect { station.release_bike }.to raise_error 'No bikes available'
      end

      it 'does not release broken bikes' do
        allow(bike).to receive(:broken?).and_return(true)
        bike.report_broken
        dock_bike
        expect { station.release_bike }.to raise_error 'Bike not available'
      end
    end

    context 'when a bike is available' do
      before { dock_bike }

      it 'releases a bike' do
        expect(station.release_bike).to eq bike
      end

      it 'releases a working bike' do
        expect(station.release_bike).to be bike
      end
    end
  end 

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    context 'when full' do
      it 'raises an error' do
        station.capacity.times { station.dock bike }
        expect { station.dock bike }.to raise_error 'Docking station full'
      end
    end

    context 'when not full' do
      it 'docks a working bike' do
        expect(station.dock(bike)).to eq [bike]
      end

      it 'docks a broken bike' do
        bike.report_broken
        expect(station.dock(bike)).to eq [bike]
      end
    end
  end
end
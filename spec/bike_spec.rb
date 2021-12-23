require 'bike'

describe Bike do
  subject(:bike) { Bike.new }

  describe '#working?' do
    it { is_expected.to respond_to :working? }
  end

  describe '#broken' do
    it { is_expected.to respond_to :broken }

    it 'is not working' do
      expect { bike.broken }.to change { bike.working? }.from(true).to(false)
    end
  end
end
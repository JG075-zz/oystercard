require 'journeys.rb'
require 'oystercard.rb'

describe Journeys do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}
  let(:card) { OysterCard.new }

  describe "#in_journey"do
    context "when called" do
      it 'checks that card is in journey' do
        journey.entry_station = entry_station
        expect(journey.in_journey?).to be true
      end
    end
  end

  describe "#fare" do
    context "charge according to zone difference" do
      it "returns the minimum fare if same zone" do
        journey.entry_station = Station.new("waterloo", 1)
        journey.exit_station = Station.new("liverpool", 1)
        expect(journey.fare).to eq 1
      end
      it "returns minimum fare plus zone difference" do
        journey.entry_station = Station.new("waterloo", 5)
        journey.exit_station = Station.new("liverpool", 1)
        expect(journey.fare).to eq 5
      end
    end
  end

  describe "#fare" do
    context "when touch out without touch in" do
      it "charges penalty fare" do
        journey.exit_station = exit_station
        expect(journey.fare).to eq Journeys::PENALTY_FARE
      end
    end

    context "when touch in without touch out" do
      it "charges penalty fare" do
        journey.entry_station = entry_station
        expect(journey.fare).to eq Journeys::PENALTY_FARE
      end
    end
  end
end

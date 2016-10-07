require "journey_log"

describe JourneyLog do
  subject(:journey_log) { described_class.new }
  subject(:entry_station) { double(:station) }
  subject(:exit_station) { double(:station) }

  describe "#start" do
    context "when called" do
      it "starts a new journey with entry_station" do
        journey_log.start(entry_station)
        expect(journey_log.journey.entry_station).to be entry_station
      end
    end
  end

  describe "#finish" do
    context "when called" do
      it "finishes a journey with exit_station" do
        journey_log.finish(exit_station)
        expect(journey_log.journey.exit_station).to be exit_station
      end
    end
  end

  describe "#save_journeys" do
    context "when called" do
      it "adds journey log array" do
        journey_log.start(entry_station)
        journey_log.finish(exit_station)
        journey_log.save_journeys
        expect(journey_log.log).to include journey_log.journey
      end
    end
  end

  describe "#current_journey" do
    context "when called" do
      it "call save_journeys if start journey twice" do
        journey_log.start(entry_station)
        journey_log.start(entry_station)
        expect(journey_log.log).to include an_instance_of(Journeys)
      end
    end
  end

  describe "#clear_journey" do
    context "when called" do
      it "sets journey to a new Journey object" do
        old_journey = journey_log.journey
        journey_log.clear_journey
        expect(journey_log.journey).not_to be old_journey
      end
    end
  end

end

require_relative "journeys"

class JourneyLog
  attr_reader :journey, :log

  def initialize
    @journey = Journeys.new
    @log = []
  end

  def start(station)
    current_journey
    @journey.entry_station = station
  end

  def finish(station)
    @journey.exit_station = station
  end

  def save_journeys
    @log << @journey
  end

  def clear_journey
    @journey = Journeys.new
  end

  private

  def current_journey
    if @journey.entry_station == nil && @journey.exit_station != nil
      save_journeys
      clear_journey
    elsif @journey.entry_station != nil && @journey.exit_station == nil
      save_journeys
      clear_journey
    end
  end
end

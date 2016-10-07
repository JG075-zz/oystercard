class Journeys
  attr_reader :counter, :completed_journeys, :entry_station, :exit_station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @counter = 0
    @completed_journeys = {}
    @entry_station = nil
    @exit_station = nil
  end

  def save_journeys
    @counter += 1
    @completed_journeys["Journey #{@counter}"] = [@entry_station, @exit_station]
  end

  def enter_station(station)
    @entry_station = station
  end

  def leave_station(station)
    @exit_station = station
  end

  def clear_journey
    @entry_station, @exit_station = nil
  end

  def fare
    #@entry_station.zone - @exit_station.zone
    return PENALTY_FARE if @entry_station == nil || @exit_station == nil
    MINIMUM_FARE
  end

  def in_journey?
    return true if @entry_station != nil
    false
  end

end

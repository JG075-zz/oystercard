class Journeys
  attr_accessor :entry_station, :exit_station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    return PENALTY_FARE if @entry_station == nil || @exit_station == nil
    MINIMUM_FARE
  end

  def in_journey?
    return true if @entry_station != nil
    false
  end

end

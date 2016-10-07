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
    zone_difference = @entry_station.zone - @exit_station.zone
    MINIMUM_FARE + zone_difference.abs
  end

  def in_journey?
    return true if @entry_station != nil
    false
  end

end

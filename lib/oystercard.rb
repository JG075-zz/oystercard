require_relative "journeys"
require_relative "station"
require_relative "journey_log"

class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
  MIN_FARE = 1

  attr_reader :balance, :max_limit, :journey_log

  def initialize(max_limit = MAX_LIMIT, balance = BALANCE)
    @max_limit = max_limit
    @balance = balance
    @journey_log = JourneyLog.new
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > 90
    @balance += value
  end

  def touch_in(station)
    raise "do not have enough money" if @balance < MIN_FARE
    deduct(@journey_log.journey.fare) if @journey_log.journey.entry_station != nil
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.journey.fare)
    journey_reset
  end

  private

  def journey_reset
    @journey_log.save_journeys
    @journey_log.clear_journey
  end

  def deduct(value)
    raise "can't deduct less than balance" if @balance < value
    @balance -= value
  end

end

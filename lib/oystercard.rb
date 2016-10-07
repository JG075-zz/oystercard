require_relative "journeys"
require_relative "station"

class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
  MIN_FARE = 1

attr_reader :balance, :max_limit, :journey

  def initialize(max_limit = MAX_LIMIT, balance = BALANCE)
    @max_limit = max_limit
    @balance = balance
    @journey = Journeys.new
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > 90
    @balance += value
  end

  def touch_in(station)
    raise "do not have enough money" if @balance < MIN_FARE
    if @journey.entry_station != nil
      deduct(@journey.fare)
      @journey.save_journeys
      @journey.clear_journey
    end
    @journey.enter_station(station)
  end

  def touch_out(station)
    @journey.leave_station(station)
    @journey.save_journeys
    deduct(@journey.fare)
    @journey.clear_journey
  end

  private

  def deduct(value)
    raise "can't deduct less than balance" if @balance < value
    @balance -= value
  end

end

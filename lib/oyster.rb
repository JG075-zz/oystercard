class Oyster
  attr_reader :balance
  attr_reader :limit

  MAXIMUM_LIMIT = 90

  def initialize
    @balance = 0
    @limit = MAXIMUM_LIMIT
  end

  def top_up(amount)
    raise "Amount exceeds limit of: #{@limit}" if amount + @balance > @limit
    @balance = @balance + amount
    return @balance
  end

end

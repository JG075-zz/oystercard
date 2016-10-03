class Oyster
  attr_accessor :balance
  def initialize
    @balance = 0
  end

  def top_up(num)
    @balance = @balance + num
    return @balance
  end
end

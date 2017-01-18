class Currency
  attr_reader :amount, :code # note :s at the beginning here

  def initialize(amount:, code:) # when sending in parameters with names do :s after
    @amount = amount
    @code = code
  end

  def == (other)
    @amount == other.amount && @code == other.code
  end

  def +(other)
    @code == other.code
    @amount + other.amount
  end

end

class Currency
  attr_accessor :amount, :code
  def initialize params = {}
    params.each { |key, value| send "#{key}=", value }
  end

  def == (other)
    @amount == other.amount && @code == other.code
  end

  def +(other)
    if @code == other.code
      @amount + other.amount
    else
      "DifferentCurrencyCodeError"
    end
  end

  def -(other)
    if @code == other.code
      @amount - other.amount
    else
      "DifferentCurrencyCodeError"
    end
  end
end

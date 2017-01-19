def is_string? string
 false if Float(string) rescue true
end

class Currency
  attr_accessor :amount, :code
  def initialize(options = {})

    amount = options[:amount] || 0
    code = options[:code] || ''

    @amount = amount.to_s.gsub(/\p{Sc}/,'').to_f.round(2)
    if code == ''
      if amount.include? "$"
        code = 'USD'
      elsif amount.include? "£"
        code = 'GBP'
      elsif amount.include? "€"
        code = 'EUR'
      elsif amount.include? "¥"
        code = 'JPY'
      elsif amount.include? "₹"
        code = 'INR'
      end
    end
    @code = code
  end

  def == (other)
    @amount == other.amount && @code == other.code
  end

  def +(other)
    if code == other.code
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

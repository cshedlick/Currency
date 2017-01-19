require './currency.rb'

class CurrencyConverter
    @@converter_hash = {
      "USD" => {"USD" => 1.0, "EUR" => 0.94088, "GBP" => 0.81255, "INR" => 68.1177, "JPY" => 115.303}
    }

  class << self
      attr_accessor :converter_hash

    def get_hash
      @@converter_hash
    end


    def convert(currency_obj, code_to_convert)
      Currency.new(amount: currency_obj * self.get_hash[currency_obj.code][code_to_convert], code: code_to_convert)
    end
  end
end

puts CurrencyConverter.convert(Currency.new(amount: 1, code: "USD"), "EUR").amount
puts Currency.new(amount: 0.94, code: "EUR").amount

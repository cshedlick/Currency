require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::test
  def test_currency_creation ## need to start with test_ then can call whatever you want
    Currency.new(amount: 34, code: 'USD')
  end
end

require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation ## need to start with test_ then can call it whatever you want
    Currency.new(amount: 34, code: 'USD')
  end

  def test_equal_currencies
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 34, code: 'USD')
    assert a == b ## assert means that it needs to be true to pass, otherwise fails

    c = Currency.new(amount: 34, code: 'EUR')
    refute a == c ## refute is opposite of assert
  end
end

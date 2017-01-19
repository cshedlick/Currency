require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation
    Currency.new(amount: 34, code: 'USD')
  end

  def test_equal_currencies
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 34, code: 'USD')
    assert a == b

    c = Currency.new(amount: 34, code: 'EUR')
    refute a == c

    d = Currency.new(amount: 100, code: 'USD')
    refute a == d
  end

  def test_mathematical_operators
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 34, code: 'USD')

    assert a+b == 68
    assert a-b == 0

    c = Currency.new(amount: 34, code: 'EUR')
    assert a+c == "DifferentCurrencyCodeError"
    assert a-c == "DifferentCurrencyCodeError"
  end

  def test_currency_creation_with_symbols
    a = Currency.new amount: '$2.00'
    assert a.amount == 2
    assert a.code == 'USD'

    b = Currency.new amount: '€2.22'
    assert b.amount == 2.22
    assert b.code == 'EUR'

    c = Currency.new amount: '£25'
    assert c.amount == 25
    assert c.code == 'GBP'

    d = Currency.new amount: '₹100'
    assert d.amount == 100
    assert d.code == "INR"

    e = Currency.new amount: '29.01¥'
    assert e.amount == 29.01
    assert e.code == 'JPY'
  end
end

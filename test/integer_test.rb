require 'test_helper'

class IntegerTest < Test::Unit::TestCase
  def test_string
    assert "0".integer?
    assert "-1".integer?
    assert !"1.0".integer?

    assert !"a".integer?
    assert !"1a".integer?
    assert !"a1".integer?
  end

  def test_symbol
    assert :'0'.integer?

    assert !:a.integer?
  end

  def test_object
    assert !Object.new.integer?
    assert !{}.integer?
  end

  def test_numeric
    assert 1.integer?
    assert !Rational(1,2).integer?
    assert !Complex(1, 1).integer?
    assert !2.3.integer?
    assert !BigDecimal('1').integer?
  end
end
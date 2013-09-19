require 'test_helper'

class FloatTest < Test::Unit::TestCase
  def test_string
    assert "0".float?
    assert "-1".float?
    assert "1.0".float?

    assert !"a".float?
    assert !"1a".float?
    assert !"a1".float?
  end

  def test_symbol
    assert :'0'.float?

    assert !:a.float?
  end

  def test_object
    assert !Object.new.float?
    assert !{}.float?
  end

  def test_numeric
    assert !1.float?
    assert !Rational(1,2).float?
    assert !Complex(1, 1).float?
    assert 2.3.float?
    assert !BigDecimal('1').float?
  end
end
require 'test_helper'

class RationalTest < Test::Unit::TestCase
  def test_string
    assert "0".rational?
    assert "-1".rational?
    assert "1.0".rational?

    assert !"a".rational?
    assert !"1a".rational?
    assert !"a1".rational?
  end

  def test_symbol
    assert :'0'.rational?

    assert !:a.rational?
  end

  def test_object
    assert !Object.new.rational?
    assert !{}.rational?
  end

  def test_numeric
    assert !1.rational?
    assert Rational(1,2).rational?
    assert !Complex(1, 1).rational?
    assert !2.3.rational?
    assert !BigDecimal('1').rational?
  end
end
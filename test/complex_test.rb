require 'test_helper'

class ComplexTest < Test::Unit::TestCase
  def test_string
    assert "0".complex?
    assert "-1".complex?
    assert "1.0".complex?
    assert "j".complex?
    assert "0.3-0.5i".complex?

    assert !"a".complex?
    assert !"1a".complex?
    assert !"a1".complex?
  end

  def test_symbol
    assert :'0'.complex?

    assert !:a.complex?
  end

  def test_object
    assert !Object.new.complex?
    assert !{}.complex?
  end

  def test_numeric
    assert !1.complex?
    assert !Rational(1,2).complex?
    assert Complex(1, 1).complex?
    assert !2.3.complex?
    assert !BigDecimal('1').complex?
  end
end
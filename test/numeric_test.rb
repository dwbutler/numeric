require 'test_helper'

class NumericTest < Test::Unit::TestCase
  def test_string
    assert "0".numeric?
    assert "-1".numeric?
    assert "1.0".numeric?
    assert "1e1".numeric?
    assert "1/2".numeric?
    assert "0.3-0.5i".numeric?

    assert !"a".numeric?
    assert !"1a".numeric?
    assert !"a1".numeric?
  end

  def test_symbol
    assert :'0'.numeric?

    assert !:a.numeric?
  end

  def test_object
    assert !Object.new.numeric?
    assert !{}.numeric?
  end

  def test_numeric
    assert 1.numeric?
    assert Rational(1,2).numeric?
    assert Complex(1, 1).numeric?
    assert 2.3.numeric?
    assert BigDecimal('1').numeric?
  end
end
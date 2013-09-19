require 'test_helper'

class DecimalTest < Test::Unit::TestCase
  def test_string
    assert "0".decimal?
    assert "-1".decimal?
    assert "1.0".decimal?
    assert "1e1".decimal?
    assert "1/2".decimal?
    assert "0.3-0.5i".decimal?

    # MRI's BigDecimal is too relaxed in what it accepts
    #pending !"a".decimal?
    #pending !"1a".decimal?
    #pending !"a1".decimal?
  end

  def test_symbol
    assert :'0'.decimal?

    #pend !:a.decimal?
  end

  def test_object
    assert !Object.new.decimal?
    assert !{}.decimal?
  end

  def test_numeric
    assert !1.decimal?
    assert !Rational(1,2).decimal?
    assert !Complex(1, 1).decimal?
    assert !2.3.decimal?
    assert BigDecimal('1').decimal?
  end
end
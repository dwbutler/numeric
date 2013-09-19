require 'rational'
require 'bigdecimal'
require 'complex'

class String
  def numeric?
    complex?
  end

  def complex?
    !!Complex(self) rescue false
  end

  def rational?
    !!Rational(self) rescue false
  end

  def integer?
    !!Integer(self) rescue false
  end

  def float?
    !!Float(self) rescue false
  end

  def decimal?
    !!BigDecimal(self) rescue false
  end
end

class Symbol
  def numeric?
    to_s.numeric?
  end

  def rational?
    to_s.rational?
  end

  def complex?
    to_s.complex?
  end

  def integer?
    to_s.complex?
  end

  def float?
    to_s.float?
  end

  def decimal?
    to_s.decimal?
  end
end

class Numeric
  def numeric?
    true
  end
end

class Complex
  def complex?
    true
  end
end

class Float
  def float?
    true
  end
end

class Rational
  def rational?
    true
  end
end

class BigDecimal
  def decimal?
    true
  end
end

module Kernel
  def numeric?
    false
  end

  def complex?
    false
  end

  def rational?
    false
  end

  def integer?
    false
  end

  def float?
    false
  end

  def decimal?
    false
  end
end
class String
  def numeric?
    !!Complex(self) rescue false
  end
end

class Symbol
  def numeric?
    to_s.numeric?
  end
end

class Numeric
  def numeric?
    true
  end
end

class BasicObject
  def numeric?
    false
  end
end
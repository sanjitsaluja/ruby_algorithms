class OrderableModel
  include Comparable

  attr_accessor :val

  def initialize(val)
    @val = val
  end

  def inspect
    "OrderableModel #{@val}"
  end

  def <=> (other)
    return @val <=> other.val
  end
end
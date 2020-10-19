class Triangle

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def valid?
    sum_of_two_exceeds_third = [(a + b > c), (b + c > a), (a + c > b)]
    each_side_larger_than_zero = [a, b, c].map {|side| side > 0 ? true : false}
    if sum_of_two_exceeds_third.include? false
      raise TriangleError
    elsif each_side_larger_than_zero.include? false
      raise TriangleError
    end
  end

  def kind
    valid?
    if a == b && b == c
      return :equilateral
    elsif a == b || b == c || a == c
      return :isosceles
    else
      return :scalene
    end
  end

  class TriangleError < StandardError
  end
end

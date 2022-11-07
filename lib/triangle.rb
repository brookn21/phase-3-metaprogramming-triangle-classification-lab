class Triangle
  attr_reader :side1, :second_side, :third_side
  def initialize(side1, second_side, third_side)
    @side1 = side1
    @second_side = second_side
    @third_side = third_side
  end

  def kind 
    validate_triangle
    if side1 == third_side && second_side == side1
      :equilateral
    elsif side1 == third_side || third_side == second_side or side1 == second_side
      :isosceles
    else  :scalene
    end
  end

  def positive_sides?
    [side1, third_side, second_side].all?(&:positive?)
  end

  def triangle_inequality?
    side1 + third_side > second_side && side1 + second_side > third_side && third_side + second_side > side1
  end

  def validate_triangle
    raise TriangleError unless positive_sides? && triangle_inequality?
  end

  class TriangleError < StandardError
  end
end

first_triangle = Triangle.new(2,1,2)

p first_triangle.validate_triangle
require 'pry'

class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    bad_triangle? ? (raise TriangleError) : ""
    self.triangle_type.intern
  end

  def triangle_type
    counter = 0
    self.side1 == self.side2 ? counter += 1 : ""
    self.side1 == self.side3 ? counter += 1 : ""
    self.side2 == self.side3 ? counter += 1 : ""
    counter == 0 ? (return "scalene") : ""
    counter == 1 ? (return "isosceles") : ""
    counter == 3 ? (return "equilateral") : ""
  end

  def bad_triangle?
    self.side1 + self.side2 <= self.side3 ? (return true) : ""
    self.side1 + self.side3 <= self.side2 ? (return true) : ""
    self.side2 + self.side3 <= self.side1 ? (return true) : ""
    self.side1 == 0 ? (return true) : ""
    self.side2 == 0 ? (return true) : ""
    self.side3 == 0 ? (return true) : ""
    return false
  end

  class TriangleError < StandardError
    def message
      "This is a bad triangle"
    end
  end
end

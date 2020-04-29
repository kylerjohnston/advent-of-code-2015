# frozen_string_literal: true

class Present
  # @return [Integer] feet
  attr_reader :width, :height, :length

  # @param width [Integer] in feet
  # @param height [Integer] in feet
  # @param length [Integer] in feet
  def initialize(width, height, length)
    @width = width
    @height = height
    @length = length
  end

  # @return [Array] the area of each side, sq. ft.
  def sides
    [(length * width), (width * height), (height * length)]
  end

  # @return [Array] feet
  def perimeters
    [
      (length * 2) + (width * 2),
      (width * 2) + (height * 2),
      (height * 2) + (length * 2)
    ]
  end

  # @return [Integer] cubic feet
  def cubic_volume
    width * length * height
  end

  # @return [Integer] surface area of the present, sq. ft
  def surface_area
    sides.inject(0) { |sum, n| sum + (n * 2) }
  end

  # @return [Integer] area of the smallest size, sq. ft
  def smallest_side
    sides.min
  end

  # @return [Integer] the amount of wrapping paper required in sq. ft
  def wrapping_paper
    surface_area + smallest_side
  end

  # @return [Integer] feet
  def ribbon_length
    perimeters.min + cubic_volume
  end
end

# frozen_string_literal: true

module Bitwise
  def and(other)
    to_i & other.to_i
  end

  def lshift(other)
    to_i << other.to_i
  end

  def not
    # Create an array of each digit of the binary representation
    # of `to_i`
    bin_array = (to_i.bit_length - 1).downto(0).map { |n| signal[n] }
    # Pad with zeroes until 16 bits
    bin_array.prepend(0) until bin_array.size >= 16
    # Bitwise NOT operation
    not_array = bin_array.map { |n| n == 0 ? n = 1 : n = 0 }
    binary_to_decimal(not_array)
  end

  def or(other)
    to_i | other.to_i
  end

  def rshift(other)
    to_i >> other.to_i
  end

  private

  # @param i [Array] each digit of binary number split into an array
  def binary_to_decimal(i)
    decimal = 0
    i.reverse.each.with_index do |x, j|
      decimal += x * (2**j)
    end
    decimal
  end
end

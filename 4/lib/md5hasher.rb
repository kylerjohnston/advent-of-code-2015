# frozen_string_literal: true

require 'digest'

class MD5Hasher
  attr_reader :key
  
  def initialize(key)
    @key = key
  end

  def find_lowest_int(zeroes: 5, int: 0)
    hash = Digest::MD5.hexdigest(key + int.to_s)
    return int if hash.start_with?('0' * zeroes)

    find_lowest_int(int: int + 1, zeroes: zeroes)
  end
end

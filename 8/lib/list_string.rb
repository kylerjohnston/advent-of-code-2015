# frozen_string_literal: true

class ListString
  attr_reader :char_array

  def initialize(char_array)
    @char_array = char_array
  end

  def rendered_size
    difference = 2 # All strings start and end with "
    pointer = 0
    while pointer < char_array.size
      c = char_array[pointer]
      if c == '\\'
        if char_array[pointer + 1] == '\\' || char_array[pointer + 1] == '"'
          # \\ or \" become \ or "
          difference += 1
          pointer += 2
        elsif /x[0-9a-f]{2}/.match?(char_array[(pointer + 1)..(pointer + 3)].join(''))
          # Hex codes
          difference += 3
          pointer += 4
        else
          pointer += 1
        end
      else
        pointer += 1
      end
    end

    size - difference
  end
       
  def to_s
    string
  end

  def size
    char_array.size
  end
end

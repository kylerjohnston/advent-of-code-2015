# frozen_string_literal: true

class String
  # Part 1 test
  def nice?
    return true if three_vowels? && two_in_a_row? && valid?

    false
  end

  # Part 2 test
  def nicer?
    return true if double_pair? && repeat_with_gap?

    false
  end

  private

  # Part 1, test 1
  def three_vowels?
    vowels = %w[a e i o u]
    vowel_count = 0
    split('').each do |l|
      vowel_count += 1 if vowels.include?(l)
      return true if vowel_count >= 3
    end

    false
  end

  # Part 1, test 2
  def two_in_a_row?
    previous = ''
    split('').each do |letter|
      if previous == letter
        return true unless previous == ''
      end

      previous = letter
    end

    false
  end

  # Part 1, test 3
  def valid?
    invalid_strings = %w[ab cd pq xy]
    invalid_strings.each do |x|
      return false if include?(x)
    end

    true
  end

  # Part 2, test 1
  def pairs
    letters = split('')
    pairs = []
    letters.each.with_index do |letter, i|
      next_letter = letters[i + 1]
      pairs << letter + next_letter unless next_letter.nil?
    end
    pairs
  end

  def double_pair?
    pairs.each do |pair|
      return true if scan(pair).size >= 2
    end

    false
  end

  # Part 2, test 2
  def repeat_with_gap?
    letters = split('')
    letters.each.with_index do |letter, i|
      next_with_gap = letters[i + 2]
      return true if letter == next_with_gap
    end

    false
  end
end

# frozen_string_literal: true

require_relative 'wire'
require_relative 'bitwise'

class Integer
  include Bitwise
end

class Circuit
  attr_reader :wires, :debug

  def initialize(debug: false)
    @wires = {}
    @debug = debug
  end

  def parse(instruction)
    # Pattern with instruction: AND, OR, NOT, LSHIFT, RSHIFT
    pattern = /([a-z0-9]*)\s?([A-Z]+) ([a-z1-9]+) -> ([a-z]+)/
    match = pattern.match(instruction)
    if match
      operands = [wire(match[1]), wire(match[3])]
      operator = match[2]
      product = wire(match[4])
      f = if operator == 'NOT'
            -> { operands[1].send(operator.downcase) }
          else
            -> { operands[0].send(operator.downcase, operands[1]) }
          end
      product.function = f
      product.add_parents(*operands.reject(&:nil?))
    else
      pattern = /([a-z0-9]+) -> ([a-z]+)/
      match = pattern.match(instruction)

      raise "Can't find a match for #{instruction}" unless match

      input = wire(match[1])
      output = wire(match[2])
      output.function = -> { input.to_i }
    end
  end

  def wire(id)
    # This is a number, not a wire id
    return id.to_i if /\d+/.match?(id)

    return nil if id.empty?

    unless wires.keys.include?(id.to_sym)
      wires[id.to_sym] = Wire.new(id, debug: debug)
    end
    wires[id.to_sym]
  end

  def signal(id)
    wire = wires[id.to_sym]
    wire.parents.reverse.each(&:run)
    wires[id.to_sym].run
  end

  def reset
    wires.each_value(&:reset)
  end
end

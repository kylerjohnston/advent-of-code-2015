#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/wire'
require_relative '../lib/circuit'

class TestDay7 < Minitest::Test
  def test_wire
    wires = {}
    wires['x'] = Wire.new('x', function: -> { 123 })
    wires['y'] = Wire.new('y', function: -> { 456 })
    wires['d'] = Wire.new('d', function: -> { wires['x'].and(wires['y']) })
    wires['e'] = Wire.new('e', function: -> { wires['x'].or(wires['y']) })
    wires['f'] = Wire.new('f', function: -> { wires['x'].lshift(2) })
    wires['g'] = Wire.new('g', function: -> { wires['y'].rshift(2) })
    wires['h'] = Wire.new('h', function: -> { wires['x'].not })
    wires['i'] = Wire.new('i', function: -> { wires['y'].not })

    assert_equal 72, wires['d'].signal
    assert_equal 507, wires['e'].signal
    assert_equal 492, wires['f'].signal
    assert_equal 114, wires['g'].signal
    assert_equal 65412, wires['h'].signal
    assert_equal 65079, wires['i'].signal
    assert_equal 123, wires['x'].signal
    assert_equal 456, wires['y'].signal

    wires['x'].function = -> { 456 }
    wires['x'].run
    assert_equal wires['i'].signal, wires['h'].run
  end

  def test_circuit
    circuit = Circuit.new
    circuit.parse('123 -> x')
    circuit.parse('456 -> y')
    circuit.parse('x AND y -> d')
    circuit.parse('x OR y -> e')
    circuit.parse('x LSHIFT 2 -> f')
    circuit.parse('y RSHIFT 2 -> g')
    circuit.parse('NOT x -> h')
    circuit.parse('NOT y -> i')

    assert_equal 72, circuit.signal('d')
    assert_equal 507, circuit.signal('e')
    assert_equal 492, circuit.signal('f')
    assert_equal 114, circuit.signal('g')
    assert_equal 65412, circuit.signal('h')
    assert_equal 65079, circuit.signal('i')
    assert_equal 123, circuit.signal('x')
    assert_equal 456, circuit.signal('y')
  end
end

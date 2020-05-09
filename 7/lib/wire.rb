# frozen_string_literal: true

require_relative 'bitwise'

class Wire
  include Bitwise
  attr_accessor :function

  attr_reader :parents, :id, :debug

  def initialize(id, function: -> { 0 }, debug: false)
    @id = id
    @function = function
    @parents = []
    @signal = nil
    @debug = debug
  end

  def run
    puts "Running wire #{id}" if debug
    @signal = function.call
    signal
  end

  def signal
    return @signal unless @signal.nil?

    run
    signal
  end

  def to_i
    signal
  end

  def add_parents(*parents)
    parents.each do |parent|
      if parent.class == Wire
        puts "Adding parent #{parent.id} to #{id}" if debug
        @parents << parent
      end
    end
  end
end

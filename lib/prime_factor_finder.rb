require 'prime'
require 'exceptions'

class PrimeFactorFinder
  attr_reader :number

  def initialize(number)
    raise InvalidIntegerError if number < 0

    @number = number
  end

  def prime_factors
    number.prime_division.map(&:first)
  end
end
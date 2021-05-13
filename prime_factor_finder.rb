require 'prime'

class PrimeFactorFinder
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def prime_factors
    number.prime_division.map(&:first)
  end
end
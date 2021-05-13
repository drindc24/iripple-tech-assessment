require './lib/exceptions'
require './lib/file_reader'
require './lib/prime_factor_finder'

begin
  in_file = FileReader.read("ins/#{ARGV[0]}")
  ans_file_name = File.basename(ARGV[0], '.in')
  ans_file = File.open("ans/#{ans_file_name}.ans", 'w')
  in_file_data = in_file.readlines.map(&:chomp)
  in_file_data.each do |line|
    finder = PrimeFactorFinder.new(line.to_i)
    least_prime_factor = finder.prime_factors.first
    greatest_prime_factor = finder.prime_factors.last
    ans_file.puts "#{line} #{least_prime_factor} #{greatest_prime_factor}"
  end
  in_file.close
  ans_file.close
rescue Errno::ENOENT
  puts 'File not found'
rescue InvalidInputFile
  puts 'Invalid input file: only .in file are allowed to be input files OR argument was not supplied'
end

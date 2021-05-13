require './lib/exceptions'

class FileReader
  def self.read(filename)
    raise InvalidInputFile unless valid_extension?(filename)
    File.open(filename)
  end

  def self.valid_extension?(filename)
    %w(.in .ans).include?(File.extname(filename))
  end
end
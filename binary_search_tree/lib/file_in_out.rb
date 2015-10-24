require 'pry'

class FileInOut

  # Reads in numbers from ARGV[0] source file, returns array
  # after converting from String to Fixnum.
  def reads
    input_file = ARGV[0]
    input = []
    File.readlines(input_file).each do | line |
      input << line.chomp.to_i
    end
    return input
  end

  # # Outputs data to ARGV[1] file.
  # def writes(data)
  #   output_file = File.open(ARGV[1], 'w')
  #   output_file.write(data)
  #   output_file.close
  # end
end
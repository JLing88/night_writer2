class Translator

  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def print_message
    "Created '#{output_file}' containing 256 characters."
  end

  def read_from_file
    file_input = File.open(@input_file, "r")
    input_string = file_input.read
    file_input.close
    input_string
  end
end

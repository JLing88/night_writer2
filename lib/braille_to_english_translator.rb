class Translator

  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def print_message
    "Created '#{output_file}' containing 256 characters."
  end
end

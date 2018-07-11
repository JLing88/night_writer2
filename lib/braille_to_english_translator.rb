class Translator

  attr_reader :input_file, :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end
end

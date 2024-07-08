class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    numbers = parse_input(input)
    check_negatives(numbers)

    numbers.reject! { |n| n > 1000 }

    numbers.sum
  end

  private

  def self.parse_input(input)
    delimiter = [",", "\n"]
    if input.start_with?("//")
      delimiter_definition = input[2..input.index("\n") - 1]
      delimiter = parse_custom_delimiter(delimiter_definition)
      input = input[input.index("\n") + 1..-1]
    end

    input.split(/[#{delimiter.join}]|\n/).map(&:to_i)
  end

  def self.parse_custom_delimiter(delimiter_definition)
    if delimiter_definition.start_with?("[")
      delimiter_definition.scan(/\[(.*?)\]/).flatten
    else
      [delimiter_definition]
    end
  end

  def self.check_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end

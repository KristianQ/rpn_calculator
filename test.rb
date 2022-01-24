require_relative 'rpn_calc'

examples = [
    ['1 2 +', '3'],
    ['1 2 -', '-1'],
    ['1 2 *', '2'],
    ['1 2 /', '0.5'],

    ['1 2 + 5 +', '8'],
    ['5 1 2 + +', '8'],
    ['1 2 - 5 +', '4'],
    ['5 1 2 - +', '4'],
    ['1 2 * 5 +', '7'],
    ['5 1 2 * +', '7'],
    ['1 2 / 5 +', '5.5'],
    ['5 1 2 / +', '5.5'],

    ['3 5 1 2 + + +', '11'],
    ['3 5 1 2 - + +', '7'],
    ['3 5 1 2 * + +', '10'],
    ['3 5 1 2 / + +', '8.5'],

    ['1     2     +', '3'],
    ['    1 2 +', '3'],
    ['1 2 +    ', '3'],
]
errors = []

examples.each do |expression, expected_result|
  calc = RPNCalc.new(expression)

  begin
    result = calc.perform

    if result.to_f != expected_result.to_f
      raise "#{expression}. #{expected_result} expected. But got #{result}"
    end

    print '.'
  rescue => e
    errors << e.message
    print 'x'
  end
end

puts
puts "#{examples.size} example(s), #{errors.size} failure(s)"
if errors.any?
  errors.each do |error|
    puts error
  end
end

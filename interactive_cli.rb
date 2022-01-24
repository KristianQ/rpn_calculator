require_relative 'rpn_calc'

EXIT_COMMAND = 'q'
class ExitSignal < StandardError; end

loop do
  begin
    print '> '

    expression = gets
    raise ExitSignal unless expression
    expression.strip!
    raise ExitSignal if expression == EXIT_COMMAND

    result = RPNCalc.new(expression).perform
    puts "= #{result}"
  rescue ExitSignal => e
    break
  rescue => e
    puts 'Error: ' + e.message
  end
end

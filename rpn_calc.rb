class RPNCalc
  def initialize(expression)
    @expression = expression
  end

  def perform
    @expression = @expression.split
    evaluation = []

    @expression.each do |item|
      case item
      when /\d+(\.\d+)?/
        evaluation.push(item.to_f)
      when '+', '-', '*', '/'
        raise 'Invalid expression' if evaluation.size < 2

        operands = evaluation.pop(2)
        raise 'Division by zero' if item == '/' && operands[1].zero?

        evaluation.push(operands[0].send(item, operands[1]))
      else
        raise 'Invalid expression'
      end
    end

    raise 'Invalid expression' if evaluation.size != 1
    evaluation.pop()
  end
end

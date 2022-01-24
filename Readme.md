# RPN Calculator

This projects implements a [Reverse Polish Notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation) (RPN) Calculator.

The calculator  parses the expression from left to right, pushing `operands` to a stack and applying an `operator` to the two top most `operands` in the stack.

Examples:

- 1 2 + = 3
- 1 2 * = 2
- 1 2 3 + + = 6
- 5 1 2 + 4 * + 3 − = 14

This implementation only supports the four basic operators (see [Trade Offs](#trade-offs)): `+ - * /`

## Technical and Architectural Choices

The calculator was implemented using the [Ruby language](https://www.ruby-lang.org/pt/) due its clean syntax and because it provides all required functions for dealing with input/output, array manipulation (for pushing/poping from stack), dynamic method calling (for calling the math operations) and simple error handling. These features together make Ruby a smart choice for building such project.

The `RPNClass` contains the calculator code, making it easy to import and use this class (The file `test.rb` demonstrates how this can be done) (see [How to Run](#how-torun)).

The project provides an interactive command line client as interface for the calculator. But the abstraction fo the code into a class allows for attaching any interface in the front of the calculator code (eg: WebSocket, file, or TCP socket).

## Trade-offs

This initial version only provides the four basic operations: `+ - * /`.

Although it would be easy to add any other "two operands" operators (eg: **, mod, div), some effort would be required to adapt the code to work with "single operands" operators (eg: square root).

## How to Run

The file `rpn_calc.rb` (`RPNCalc` class) contains the calculator code. You can import this file and use the calculator:

```ruby
require_relative 'rpn_calc'
calc = RPNCalc.new('1 2 +')
calc.perform # => 3.0
```

This project also includes an Interactive Client that you can run directly in command line:

```shell
$ ruby interactive_cli.rb
> 1 2 +
= 3.0
> q
$
```

You can type `q` to exit the interactive client, or you can exit by typing `Ctrl+D`.

You can also run the test suite to test many expressions, including some edge cases:

```shell
$ ruby test.rb
...................
19 example(s), 0 failure(s)
```

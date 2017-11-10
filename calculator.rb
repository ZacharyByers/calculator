def adder(a, b)
  a + b
end

def subtracter(a, b)
  a - b
end

def multiplier(a, b)
  a * b
end

def divider(a, b)
  a / b
end

def raise_to_power(a, b)
  a ** b
end

def modulo(a, b)
  a % b
end

def error_message
  puts "Error"
end

def clear_or_quit(input)
  case input
  when 'c'
    first_calc
  when 'q'
    exit 0
  end
end

Operators = ['+', '-', '*', '/', '^', '%']

def first_calc
  @result = 0
  @memory = 0

  puts "Input a number, an operator, then another number. Valid operators: + - * / ^ %."
  puts "Press c to clear, q to quit, ms to store the last number entered, m to use stored value."

  while true
    input = gets.strip
    case input
    when 'c' , 'q'
      clear_or_quit(input)
    when 'ms'
      @memory = @result
      redo
    when 'm'
      input = @memory
    else
    input = Float(input) rescue nil
    end

    if input == nil
      error_message
      redo
    else
      break
    end
  end
  calculator(input)
end

def calculator(num1)

  while true
    op = gets.strip
    if op == 'c' || op == 'q'
      clear_or_quit(op)
    elsif op == 'ms'
      @memory = num1
      redo
    elsif Operators.include?(op) == false
      error_message
      redo
    else
      break
    end
  end

  while true
    num2 = gets.strip

    case num2
    when 'c' , 'q'
      clear_or_quit(num2)
    when 'ms'
      @memory = num1
      redo
    when 'm'
      num2 = @memory
    else
      num2 = Float(num2) rescue nil
    end

    if num2 == nil
      error_message
      redo
    else
      break
    end
  end

  case op
  when '+'
    @result = adder(num1, num2)
  when '-'
    @result = subtracter(num1, num2)
  when '*'
    @result = multiplier(num1, num2)
  when '/'
    @result = divider(num1, num2)
  when '^'
    @result = raise_to_power(num1, num2)
  when '%'
    @result = modulo(num1, num2)
  else
    error_message
    first_calc
  end

  puts "#{@result}"

  calculator(@result)


end

puts "Welcome to Ruby Calculator"

first_calc

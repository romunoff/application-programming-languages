printf 'Enter first number='
first_number = STDIN.gets.chomp.to_f

printf 'Choose an operation (+,-,*,/):'
operation = STDIN.gets.chomp

printf 'Enter second number='
second_number = STDIN.gets.chomp.to_f

printf 'Result:'

case operation
when '+'
  puts first_number + second_number
when '-'
  puts first_number - second_number
when '*'
  puts first_number * second_number
when '/'
  begin
    puts first_number / second_number
  rescue ZeroDivisionError => error
    puts error.message
  end
else
  puts 'Operation not found!'
end
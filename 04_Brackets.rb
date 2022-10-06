def is_valid_sequence(string)
  brackets = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  stack  = []

  string.each_char do |char|
    if brackets.keys.include?(char)
      stack << char
    elsif brackets.values.include?(char)
      if char == brackets[stack.last]
        stack.pop
      else return false
      end
    end
  end

  stack.empty?
end

brackets = ''

while true
  print "Enter bracket:"
  brackets << STDIN.gets.chomp.encode('UTF-8')[0]
  puts "Your string = #{brackets}"
  puts "Validation result = #{is_valid_sequence(brackets)}"
  puts ''
end
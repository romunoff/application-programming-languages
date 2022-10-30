def find_frequent_words (string)
  frequent_words = Hash.new

  string.downcase.scan(/[a-z']+/).each do |word|
    if frequent_words.key? word
      frequent_words[word] += 1
    else
      frequent_words[word] = 1
    end
  end

  frequent_words.sort_by { |_, value | -value }
end

def print_result (string)
  result = find_frequent_words(string)

  if result.empty?
    puts "String is empty!"
  else
    puts "{"
    result[0..2].each do |key, value|
      puts "\t#{key} => #{value}"
    end
    puts "}"
  end
end

print "Enter string:"
input_string = STDIN.gets.chomp
print_result(input_string)
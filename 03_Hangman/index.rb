total_attempts = 7
wrong_attempts_counter = 0

def get_random_word
  words = %w[adviser deposit ghostwriter plane sugar]
  words.sample
end

hidden_word = get_random_word
word_pattern = hidden_word.split('').map { '_' }.join('')

while wrong_attempts_counter < total_attempts
  print 'Hidden word: '
  puts word_pattern

  puts "Number of mistakes = #{wrong_attempts_counter}"

  print 'Enter letter: '
  letter = STDIN.gets.chomp.encode('UTF-8')[0]
  puts ''

  is_letter_exists = false
  hidden_word.split('').each_with_index do |hidden_letter, index|
    if hidden_letter === letter
      is_letter_exists = true
      word_pattern[index] = hidden_letter
    end
  end

  if word_pattern.gsub('_', '') === hidden_word.length
    puts 'You win!'
    break
  elsif !is_letter_exists
    wrong_attempts_counter += 1
    if wrong_attempts_counter >= total_attempts
      puts 'You died!'
    end
  end
end
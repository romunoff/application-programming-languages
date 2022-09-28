input_string = 'The sunset sets at twelve o\' clock.'
puts input_string

def get_letter_code(letter)
  letter.ord
end

def get_alphabet_position(string)
  first_letter_code = 'a'.ord
  last_letter_code = 'z'.ord

  "#{string
       .downcase
       .split('')
       .map { |letter| get_letter_code(letter) }
       .select { |letter_code| letter_code >= first_letter_code && letter_code <= last_letter_code }
       .map { |letter_code| letter_code - first_letter_code + 1 }}
  ".gsub(",", "")
end

puts get_alphabet_position(input_string)
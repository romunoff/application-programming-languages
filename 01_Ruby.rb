TURN_VARIATIONS = %w[Rock Scissors Paper]

COMPUTER_TURN = rand(3)

puts '(0 - Rock, 1 - Scissors, 2 - Paper)'
puts 'Your turn: '

USER_TURN = gets.to_i

if USER_TURN < 0 || USER_TURN > 2
  puts 'Select the correct value!'
else
  puts 'Your turn: ' + TURN_VARIATIONS[USER_TURN]
  puts 'Computer turn: ' + TURN_VARIATIONS[COMPUTER_TURN]

  if USER_TURN == COMPUTER_TURN
    puts 'Draw!'
  elsif USER_TURN == 0 && COMPUTER_TURN == 1 ||
        USER_TURN == 1 && COMPUTER_TURN == 2 ||
        USER_TURN == 2 && COMPUTER_TURN == 0
    puts 'You win!'
  else
    puts 'Computer win!'
  end
end


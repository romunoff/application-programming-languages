# input = [[5,3,0,0,7,0,0,0,0],
#          [6,0,0,1,9,5,0,0,0],
#          [0,9,8,0,0,0,0,6,0],
#          [8,0,0,0,6,0,0,0,3],
#          [4,0,0,8,0,3,0,0,1],
#          [7,0,0,0,2,0,0,0,6],
#          [0,6,0,0,0,0,2,8,0],
#          [0,0,0,4,1,9,0,0,5],
#          [0,0,0,0,8,0,0,7,9]]

input = [[4,0,1,0],
         [0,2,0,0],
         [0,0,3,0],
         [0,0,2,0]]

def solve_sudoku(board)
  size = 4
  box_size = 2

  find_empty = ->(board) {
    (0..size - 1).each do |row|
      (0..size - 1).each do |column|
        if board[row][column] === 0
          return [row, column]
        end
      end
    end

    return nil
  }

  validate = ->(number, position, board) {
    row = position[0]
    column = position[1]

    # Check rows
    (0..size - 1).each do |i|
      if board[i][column] === number and i != row
        return false
      end
    end

    # Check columns
    (0..size - 1).each do |i|
      if board[row][i] === number and i != column
        return false
      end
    end

    # Check box
    box_row = ((row / box_size) * box_size).floor
    box_column = ((column / box_size) * box_size).floor
    (box_row..box_row + box_size - 1).each do |i|
      (box_column..box_column + box_size - 1).each do |j|
        if board[i][j] === number and i != row and j != column
          return false
        end
      end
    end

    return true
  }

  solve = ->() {
    current_position = find_empty.call(board)

    if current_position === nil
      return true
    end

    puts "------------------------------------------------------------------------------"

    (1..size).each do |number|
      is_valid = validate.call(number, current_position, board)

      puts "[INFO]: Current position: #{current_position}\tCurrent number: #{number}\tIsValid: #{is_valid}"

      if is_valid
        x = current_position[0]
        y = current_position[1]

        board[x][y] = number

        if solve.call
          return true
        end

        board[x][y] = 0
      end
    end

    return false
  }

  solve.call

  board
end

def printer(board)
  board.each do |row|
    puts row.join(' ')
  end
end

printer(solve_sudoku(input))
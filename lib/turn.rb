def turn(board)
  puts "Please enter 1-9:"
  input = gets.to_i
  if input.between?(1,9)#validation
    index = input_to_index(input)
  else
    turn(board) #repeat input
  end
  if !(valid_move?(board,index))
    turn(board)
  end
  move(board,index)
  display_board(board)
end

## helper methods ##
def display_board (board = [' ',' ',' ',' ',' ',' ',' ',' ',' ' ])
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

def valid_move?(board, index)
  if (index == nil)
    return false
  end
  if !(index.between?(0,8))
    return false
  end
  if (position_taken?(board,index))
    return false
  end
  return true
end

#returns true when position is not blank
def position_taken?(board, index)
  board[index] != " " && board[index] != "" && board[index] != nil
end

def input_to_index(input)
  index = input.to_i
  index = index - 1
  return index
end

def move (board, index, char = "X")
  board[index] = char
end

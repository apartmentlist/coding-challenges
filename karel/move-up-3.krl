# Lay down 3 tokens to initialize the board
put
put
put

def turn_left
  turn
end

def turn_right
  turn
  turn
  turn
end

def turn_around
  turn
  turn
end

def go_to_end_of_trail
  turn_left
  move
  turn_right
  move
  while on_token
    move
  end
end

while on_token
  pick
  go_to_end_of_trail
  put
  turn_around
  while on_token
    move
  end
  turn_left
  move
  turn_left
end

go_to_end_of_trail
turn_around
move
turn_left
move
turn_left

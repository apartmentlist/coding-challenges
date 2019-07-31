def turn_right
  turn_left
  turn_left
  turn_left
end

def turn_around
  turn_left
  turn_left
end

def move_pile
  while token?
    move
    put
    turn_around
    move
    pick
    turn_around
  end
end

def breadcrumb
  while token?
    move_pile
    move
    pick
  end
  move
end

def clean
  while token?
    pick
  end
end

def move_until_token
  while !token?
    move
  end
end

def move_pile_to_token
  while token?
    move
    move_until_token
    put
    turn_around
    move
    move_until_token
    pick
    turn_around
  end
  move
  move_until_token
end

# Mark X Axis
turn_left
move
move
move
put

# Find Y pile
turn_around
move
move
turn_right
move
turn_around

breadcrumb
clean
turn_left
move
put # Mark location

## Back to X pile
move
turn_left
move_until_token # X Axis
turn_left
move
turn_right
move
turn_around

move_pile_to_token
pick
turn_right
breadcrumb
move

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
    turn_around
    pick
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

def move_until_token
  move
  while !token?
    move
  end
end

def move_pile_to_token
  while token?
    move_until_token
    put
    turn_around
    move_until_token
    pick
    turn_around
  end
  move_until_token
end

# Find Y pile
turn_left
move
turn_left
move
turn_around

breadcrumb
turn_left
move
put # Mark location
turn_left
move_until_token
turn_around

move_pile_to_token
pick # Eat marker
turn_right
breadcrumb
move

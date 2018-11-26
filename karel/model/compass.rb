require_relative 'location'

module Model
  class Compass
    DIRECTIONS = {
      up: [0, 1],
      left: [-1, 0],
      down: [0, -1],
      right: [1, 0]
    }

    attr_reader :direction

    def initialize(direction)
      @direction = direction
    end

    def translate_location(location)
      Location.new(
        location.x + DIRECTIONS[direction][0],
        location.y + DIRECTIONS[direction][1]
      )
    end

    def turn
      dir_index = DIRECTIONS.keys.index(direction)
      dir_index += 1
      dir_index %= DIRECTIONS.length
      self.class.new(DIRECTIONS.keys[dir_index])
    end
  end
end

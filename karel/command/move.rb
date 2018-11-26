module Command
  class Move
    def execute(compass, location, tokens)
      new_location = compass.translate_location(location)
      [nil, compass, new_location, tokens, 1]
    end
  end
end

module Command
  class Turn
    def execute(compass, location, tokens)
      [nil, compass.turn, location, tokens, 1]
    end
  end
end

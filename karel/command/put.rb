module Command
  class Put
    def execute(compass, location, tokens)
      tokens.put(location)
      [nil, compass, location, tokens, 1]
    end
  end
end

module Command
  class Pick
    def execute(compass, location, tokens)
      tokens.pick(location)
      [nil, compass, location, tokens, 1]
    end
  end
end

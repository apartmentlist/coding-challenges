module Command
  class OnToken
    def execute(compass, location, tokens)
      [tokens.any?(location), compass, location, tokens, 1]
    end
  end
end

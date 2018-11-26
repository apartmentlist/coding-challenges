module Command
  class Not
    def initialize(statement)
      @statement = statement
    end

    def execute(compass, location, tokens)
      result, _, _, _, value = @statement.execute(compass, location, tokens)
      [!result, compass, location, tokens, value]
    end
  end
end

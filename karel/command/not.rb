module Command
  class Not
    def initialize(statement)
      @statement = statement
    end

    def execute(compass, location, tokens)
      result, _, _, _, operations_count = @statement.execute(
        compass, location, tokens
      )
      [!result, compass, location, tokens, operations_count]
    end
  end
end

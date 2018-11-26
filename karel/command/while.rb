module Command
  class While
    def initialize(condition_statement)
      @condition_statement = condition_statement
      @statements = []
    end

    def add_statement(statement)
      @statements << statement
    end

    def execute(compass, location, tokens)
      result, _, _, _, operations_count = @condition_statement.execute(
        compass, location, tokens
      )
      while result
        @statements.each do |statement|
          _, compass, location, tokens, cnt = statement.execute(
            compass, location, tokens
          )
          operations_count += cnt
        end
        result, _, _, _, cnt = @condition_statement.execute(
          compass, location, tokens
        )
        operations_count += cnt
      end
      [nil, compass, location, tokens, operations_count]
    end
  end
end

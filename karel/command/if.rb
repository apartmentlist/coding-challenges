module Command
  class If
    def initialize(condition_statement)
      @condition_statement = condition_statement
      @body_statements = []
      @else_statements = []
      @in_else = false
    end

    def else!
      raise ArgumentError, 'unexpected else statement' if @in_else
      @in_else = true
    end

    def add_statement(statement)
      if @in_else
        @else_statements << statement
      else
        @body_statements << statement
      end
    end

    def execute(compass, location, tokens)
      result, _, _, _, operations_count = @condition_statement.execute(
        compass, location, tokens
      )
      statements = result ? @body_statements : @else_statements
      statements.each do |statement|
        _, compass, location, tokens, cnt = statement.execute(compass, location, tokens)
        operations_count += cnt
      end
      [nil, compass, location, tokens, operations_count]
    end
  end
end

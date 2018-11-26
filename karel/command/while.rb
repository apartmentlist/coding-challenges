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
      result, _, _, _, value = @condition_statement.execute(compass, location, tokens)
      while result
        @statements.each do |statement|
          _, compass, location, tokens, v = statement.execute(compass, location, tokens)
          value += v
        end
        result, _, _, _, v = @condition_statement.execute(compass, location, tokens)
        value += v
      end
      [nil, compass, location, tokens, value]
    end
  end
end

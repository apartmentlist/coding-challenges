require_relative 'response'

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
      response = @condition_statement.execute(compass, location, tokens)
      operations_count = response.operations_count
      while response.return_value
        response = Batch.new(@statements).execute(
          response.compass,
          response.location,
          response.tokens
        )
        operations_count += response.operations_count
        response = @condition_statement.execute(
          response.compass, response.location, response.tokens
        )
        operations_count += response.operations_count
      end
      Response.new(
        compass: response.compass,
        location: response.location,
        tokens: response.tokens,
        operations_count: operations_count
      )
    end
  end
end

require_relative 'batch'
require_relative 'response'

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
      response = @condition_statement.execute(compass, location, tokens)
      operations_count = response.operations_count
      statements = response.return_value ? @body_statements : @else_statements
      batch_response = Batch.new(statements).execute(
        response.compass, response.location, response.tokens
      )

      Response.new(
        compass: batch_response.compass,
        location: batch_response.location,
        operations_count: response.operations_count + batch_response.operations_count,
        tokens: batch_response.tokens
      )
    end
  end
end

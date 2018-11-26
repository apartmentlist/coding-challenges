require_relative 'response'

module Command
  class Batch
    def initialize(statements)
      @statements = statements
    end

    def execute(compass, location, tokens)
      operations_count = 0
      response = Response.new(
        compass: compass, location: location, tokens: tokens
      )
      @statements.each do |statement|
        response = statement.execute(
          response.compass, response.location, response.tokens
        )
        operations_count += response.operations_count
      end

      Response.new(
        compass: response.compass,
        location: response.location,
        operations_count: operations_count,
        tokens: response.tokens
      )
    end
  end
end

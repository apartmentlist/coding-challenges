require_relative 'response'

module Command
  class Not
    def initialize(statement)
      @statement = statement
    end

    def execute(compass, location, tokens)
      response = @statement.execute(compass, location, tokens)
      Response.new(
        compass: response.compass,
        location: response.location,
        operations_count: response.operations_count,
        return_value: !response.return_value,
        tokens: response.tokens
      )
    end
  end
end

require_relative 'batch'

module Command
  class Program
    def initialize
      @statements = []
    end

    def add_statement(statement)
      @statements << statement
    end

    def execute(compass, location, tokens)
      Batch.new(@statements).execute(compass, location, tokens)
    end
  end
end

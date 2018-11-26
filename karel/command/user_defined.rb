require_relative 'batch'

module Command
  class UserDefined
    attr_reader :name

    def initialize(name)
      @name = name
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

module Command
  class Program
    def initialize
      @statements = []
    end

    def add_statement(statement)
      @statements << statement
    end

    def execute(compass, location, tokens)
      value = 0
      @statements.each do |statement|
        _, compass, location, tokens, v = statement.execute(compass, location, tokens)
        value += v
      end
      [nil, compass, location, tokens, value]
    end
  end
end

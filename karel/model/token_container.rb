module Model
  class TokenContainer
    def initialize
      @tokens = {}
    end

    def any?(location)
      @tokens.key?(location)
    end

    def pick(location)
      if !@tokens.key?(location)
        fail "No tokens at #{location}"
      elsif @tokens[location] == 1
        @tokens.delete(location)
      else
        @tokens[location] -= 1
      end
    end

    def put(location)
      @tokens[location] ||= 0
      @tokens[location] += 1
    end

    def as_json
      @tokens.keys.sort.map do |location|
        {
          'location' => { 'x' => location.x, 'y' => location.y },
          'count' => @tokens[location]
        }
      end
    end
  end
end

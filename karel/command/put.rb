require_relative 'response'

module Command
  class Put
    def execute(compass, location, tokens)
      Response.new(
        compass: compass,
        location: location,
        tokens: tokens.put(location)
      )
    end
  end
end

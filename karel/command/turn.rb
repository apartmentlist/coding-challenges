require_relative 'response'

module Command
  class Turn
    def execute(compass, location, tokens)
      Response.new(
        compass: compass.turn,
        location: location,
        tokens: tokens
      )
    end
  end
end

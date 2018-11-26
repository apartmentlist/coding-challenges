require_relative 'response'

module Command
  class Move
    def execute(compass, location, tokens)
      new_location =
      Response.new(
        compass: compass,
        location: compass.translate_location(location),
        tokens: tokens
      )
    end
  end
end

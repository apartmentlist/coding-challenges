require_relative 'response'

module Command
  class OnToken
    def execute(compass, location, tokens)
      Response.new(
        compass: compass,
        location: location,
        return_value: tokens.any?(location),
        tokens: tokens
      )
    end
  end
end

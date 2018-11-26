require_relative 'response'

module Command
  class Pick
    def execute(compass, location, tokens)
      Response.new(
        compass: compass,
        location: location,
        tokens: tokens.pick(location)
      )
    end
  end
end

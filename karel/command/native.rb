require_relative 'move'
require_relative 'on_token'
require_relative 'pick'
require_relative 'put'
require_relative 'turn'

module Command
  NATIVE = {
    'move' => Move.new,
    'on_token' => OnToken.new,
    'pick' => Pick.new,
    'put' => Put.new,
    'turn' => Turn.new
  }
end

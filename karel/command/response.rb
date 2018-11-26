module Command
  class Response
    attr_reader *%i[
      compass
      location
      operations_count
      return_value
      tokens
    ]

    def initialize(
      compass:,
      location:,
      tokens:,
      operations_count: 1,
      return_value: nil
    )
      @compass = compass
      @location = location
      @return_value = return_value
      @tokens = tokens
      @operations_count = operations_count
    end
  end
end

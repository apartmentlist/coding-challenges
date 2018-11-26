module Model
  Location = Struct.new(:x, :y) do
    def <=>(other)
      if x == other.x
        y <=> other.y
      else
        x <=> other.x
      end
    end
  end
end

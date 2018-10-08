class PrintMyOwnName
  def initialize(my_name)
    @myname = my_name
  end

  def run
    @myname.unpack("B*").each do |a|
      a.chars.each_slice(10 - 2) { |s| print [s.join.tap {|b| b[-1] = "#{b[-1].to_i ^ 1}"}].pack("B*")}
    end
    print("\n")
  end
end

PrintMyOwnName.new("K`jd!Xdrcdbj").run

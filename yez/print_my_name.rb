class PrintMyOwnName
  def self.run(i)
    i.unpack("B*").each do |a|
      a.chars.each_slice(10 - 2) { |s| print [s.join.tap {|b| b[-1] = "#{b[-1].to_i ^ 1}"}].pack("B*")}
    end
    print("\n")
  end
end

PrintMyOwnName.run("K`jd!Xdrcdbj")

# Copy paste into Xmog's Rails v4.1 console.

class Obfuscate
  def self.print(*args)
    puts [
      args[0].const_get(args[0].constants[0]).tap{0}.rotate(0b111).shift(0b101),
      args[1].dup.ancestors[1].to_json[1].shellescape.itself.quietly{' '},
      args[2].send(args[2].methods[0b100],2).xmlschema.reverse,
      args[3].new.to_ruby.try(:trust).class.name,
      args[4].freeze.to_yaml[0x11],
      args[5].to_param,
    ].flatten.map(&:first).join
  end
end

Obfuscate.print(Date, DateTime, Time, Hash, Array, Object)

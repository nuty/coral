require_relative "/home/nuty/code/ruby/coral/base"


class Number < Struct.new(:value)
    include CoralBase
end


class Boolean < Struct.new(:value)
    include CoralBase
end



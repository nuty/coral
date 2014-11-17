require_relative "/home/nuty/code/ruby/coral/base"


class Variable < Struct.new(:name)
    include CoralBase

    def to_s
        name.to_s
    end

    def inspect
    end


    def reducible?
        true
    end

    def reduce(env)
        env[name]
    end

end


class Add < Struct.new(:left, :right)
    include CoralBase
    
    def to_s
        "#{left} + #{right}"
    end

    def reducible?
        true
    end

    def reduce(env)
        if left.reducible?
            Add.new(left.reduce(env),right)
        elsif right.reducible?
            Add.new(left,right.reduce(env))
        else
            Number.new(left.value + right.value)
        end
    end
end

class Mutiply < Struct.new(:left,:right)
    include CoralBase

    def to_s
        "#{left} * #{right}"
    end

    def reduce(env)
        if left.reducible?
            Add.new(left.reduce(env),right)
        elsif right.reducible?
            Add.new(left,right.reduce(env))
        else
            Number.new(left.value * right.value)
        end
    end

    def reducible?
        true
    end
end

class LessThan < Struct.new(:left,:right)
    include CoralBase

    def to_s
        "#{left} < #{right}"
    end

    def reducible?
        true
    end

    def reduce(env)
        if left.reducible?
            LessThan.new(left.reduce(env),right)
        elsif right.reducible?
            LessThan.new(left,right.reduce(env))
        else
            Boolean.new(left.value < right.value)
        end
    end

end

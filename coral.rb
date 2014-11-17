require_relative '/home/nuty/code/ruby/coral/operator'
require_relative '/home/nuty/code/ruby/coral/type'
require_relative '/home/nuty/code/ruby/coral/machine'


Machine.new(
        Add.new(
            Mutiply.new(Number.new(1),Number.new(2)),
            Mutiply.new(Number.new(3),Number.new(4))
        )
    )

Machine.new(
    LessThan.new(Number.new(5),Add.new(Number.new(1),Number.new(2)))
    )


m = Machine.new(
    Add.new(Variable.new(:x),Variable.new(:y)),
    {x:Number.new(3),y:Number.new(4)}
    )

#require "/home/nuty/code/ruby/coral/coral"
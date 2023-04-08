classdef gamestate < Simulink.IntEnumType
    enumeration 
        start(1)
        inplay(2)
        outofplay(3)
        goalscored(4)
        gameend(5)
    end
end

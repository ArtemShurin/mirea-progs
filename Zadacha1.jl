using HorizonSideRobots
function line(r,HS)
    while !isborder(r,HorizonSide(HS % 4))
        move!(r,HorizonSide(HS % 4))
        putmarker!(r)
    end
    while ismarker(r)
        move!(r,HorizonSide((HS + 2)% 4))
    end
end

function all(r)
    for i = 0:3
        line(r,i)
    end
    putmarker!(r)
end

all(r)
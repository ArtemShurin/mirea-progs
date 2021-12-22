using  HorizonSideRobots
function markers(r)
    HS = 3
    while !ismarker(r) || !isborder(r,HorizonSide((HS) % 4))
        putmarker!(r)
        if !isborder(r,HorizonSide((HS) % 4))
            move!(r,HorizonSide((HS) % 4))
        else
            HS += 1
            move!(r,HorizonSide((HS) % 4))
        end
        if ismarker(r)
            break
        end
    end
    
end

function N(r)
    y = 0
    while !isborder(r,Sud)
        move!(r,Sud)
        y += 1
    end
    markers(r)
    for i = 1:y
        move!(r,Nord)
    end
end

N(r)
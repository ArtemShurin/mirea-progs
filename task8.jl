using HorizonSideRobots
function search(r)
    i = 1
    j = 3
    while isborder(r,HorizonSide(0))
        for n in 1:i
            move!(r,HorizonSide(j % 4))
            if !isborder(r, HorizonSide(0))
                break
            end
        end
        j += 2
        i += 4

    end
    
end

search(r)
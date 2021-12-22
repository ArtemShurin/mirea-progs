using HorizonSideRobots
function find(r)
    x,y = ugl(r)
    count1 = 1
    count2 = 1
    while !isborder(r,Ost)
        move!(r,Ost)
        count1 += 1
    end
    move!(r,Nord)
    i = 0
    while true
        while !isborder(r,West)
            move!(r,West)
            count2 += 1
        end
        if count2 == count1
            count2 = 1
            move!(r,Nord)
        else
            i = 1
            break
        end
        while !isborder(r,Ost)
            move!(r,Ost)
            count2 += 1
        end
        if count2 == count1
            count2 = 1
            move!(r,Nord)
        else
            i = 3
            break
        end
    end
    ob(r,i)
    ugl2(r)
    back(r,x,y)
end

function  ugl(r)
    x = 0
    y = 0
    while !isborder(r,Sud)
        move!(r,Sud)
        y += 1
    end
    while !isborder(r,West)
        move!(r,West)
        x += 1
    end
    while !isborder(r,Sud)
        move!(r,Sud)
        y += 1
    end
    while !isborder(r,West)
        move!(r,West)
        x += 1
    end
    return x, y
end

function  ugl2(r)
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
end

function back(r,x,y)
    for i in 1:x
        move!(r,Ost)
    end
    for i in 1:y
        move!(r,Nord)
    end
end

function ob(r,i)
    putmarker!(r)
    while isborder(r,HorizonSide(i))
        move!(r,HorizonSide(0))
        putmarker!(r)
    end
    move!(r,HorizonSide(i))
    putmarker!(r)
    while isborder(r,HorizonSide(2))
        move!(r,HorizonSide(i))
        putmarker!(r)
    end
    move!(r,HorizonSide(2))
    putmarker!(r)
    i += 2
    while isborder(r,HorizonSide(i % 4))
        move!(r,HorizonSide(2))
        putmarker!(r)
    end
    move!(r,HorizonSide(i % 4))
    putmarker!(r)
    while isborder(r,HorizonSide(0))
        move!(r,HorizonSide(i % 4))
        putmarker!(r)
    end
end

find(r)
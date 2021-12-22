using HorizonSideRobots

function Obhod(r)
    a = 0
    count = 0
    while !isborder(r,Ost)
        move!(r,Ost)
        if ismarker(r)
            a += temperature(r)
            count += 1
        end
    end
    if !isborder(r,Nord)
        move!(r,Nord)
        if ismarker(r)
            a += temperature(r)
            count += 1

        end
    end
    while !isborder(r,West)
        move!(r,West)
        if ismarker(r)
            a += temperature(r)
            count += 1

        end
    end
    return a,count
end

function  all(r)
    
    x = 0
    y = 0
    i = 0
    j = 0
    while !isborder(r,Nord)
        x , y = Obhod(r)
        i += x
        j += y
    end
    return print(i / j)
end

all(r)
    
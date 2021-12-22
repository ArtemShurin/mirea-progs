function movements(r,side)
    while !isborder(r,side) && !ismarker(r)
        move!(r,side)
    end 
end

function revers(side)
    side = HorizonSide((Int(side)+2)%4)
    return side
end

function counter(r, side, count)
    for i = 1:count 
        move!(r,side)
    end 
end

function move_to_side!(r, side)
    count = 0
    while !isborder(r,side) 
        move!(r,side)
        count = count + 1
    end 
    return count
end

function ugl(r)
    x = 0
    y = 0
    while !isborder(r, Sud) || !isborder(r, West)
        y = y + move_to_side!(r, Sud)
        x = x + move_to_side!(r, West)
    end
    return x, y
end

function Vozvrat(r, x, y)
    ugl(r)
    counter(r, Nord, y)
    counter(r, Ost, x)
end

function chess1(side, n, x, y, r)
    while !isborder(r, side)
        move!(r, side)
        if side == Ost
            x = x + 1;
        else
            x = x - 1;
        end

        put(r, x, y, n)

    end

    return x, y
end

function put(r, x, y, n)
    if ((x ÷ n) + (y ÷ n)) % 2 == 0
        putmarker!(r)
    end
end


function chess(r, n)
    z = 0
    m = 0
    z, m = ugl(r)

    side = Ost;
    x = 0;
    y = 0;

    if ((x ÷ n) + (y ÷ n)) % 2 == 0
        putmarker!(r)
    end

    while isborder(r,Nord) == false

        x, y = chess1(side, n, x, y, r)

        move!(r,Nord);
        y = y + 1;

        side = revers(side);

        put(r, x, y, n)

    end

    x, y = chess1(side, n, x, y, r)

    Vozvrat(r, z, m)
    

end

n = 3

chess(r,n)




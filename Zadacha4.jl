
function line(r)
    while !isborder(r,West)
        putmarker!(r)
        move!(r,West)
    end
    putmarker!(r)
    while ismarker(r)
        move!(r,Ost)
    end
end

function put(r,x,y)
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

function ug(r)
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
end

function  yui(r,x,y)
    for i in 1:x
        move!(r,Ost)
    end
    for i in 1:y
        move!(r,Nord)
    end
end

function diag(r)
    a,b = put(r,0,0)
    putmarker!(r)
    while !isborder(r,Ost)
        move!(r,Ost)
        putmarker!(r)
    end
    move!(r,Nord)
    move!(r,West)
    while !isborder(r,Nord)
        line(r)
        move!(r,Nord)
        move!(r,West)
        move!(r,West)
    end
    line(r)
    ug(r)
    yui(r,a,b)
end

diag(r)
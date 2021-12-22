using HorizonSideRobots

function putpointcorners(r)
    start = []
    start = ugl!(r)
    pointincorner!(r)
    Vozvrat(r,start)
end

function count(r,side)
    c=0
    while isborder(r,side) == 0
        move!(r,side)
        c += 1    
    end
    return c
end

function ugl!(r)
start=[]
    while !isborder(r,Nord) || !isborder(r,West)
        x=count(r,Nord)
        y=count(r,West)
        push!(start,x)
        push!(start,y)
    end
    return start
end

function pointincorner!(r)
    for side in [Sud,Ost,Nord,West]
        while !isborder(r,side)
            move!(r,side)
        end
    putmarker!(r)
    end
end

function Vozvrat(r,start)
    reverse!(start)
    for i = 1:length(start)
        if i%2==0
            cmove!(r,Sud,start[i])
        else
            cmove!(r,Ost,start[i]) 
        end 
    end
end

function cmove!(r,side,c)
    for i in 1:c
        move!(r,side)
    end
end

putpointcorners(r)
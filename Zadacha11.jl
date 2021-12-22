using HorizonSideRobots
function moves(r,HS)
    y = 0
    Flag = true
    while !isborder(r,HorizonSide(HS)) || Flag
        if !isborder(r,HorizonSide(HS))
            move!(r,HorizonSide(HS))
            y += 1
        end
        if isborder(r,HorizonSide(HS))
            Flag, y = Obhod(r,HS,y)
        end
        if Flag == false
            break
        end
    end
    putmarker!(r)
    Vozvrat(r,HS,y)
end


function Obhod(r,HS,y)
    x = 0
    Flag = true
    while isborder(r,HorizonSide(HS)) && !isborder(r,HorizonSide((HS + 1) % 4))
        move!(r,HorizonSide((HS + 1) % 4))
        x += 1
    end
    if isborder(r,HorizonSide(HS)) && isborder(r,HorizonSide((HS + 1) % 4))
        Flag = false
    end
    if  !isborder(r,HorizonSide(HS))     
        move!(r,HorizonSide(HS))
        y += 1
    end
    while !isborder(r,HorizonSide(HS)) && isborder(r,HorizonSide((HS + 3) % 4))
        move!(r,HorizonSide(HS))
        y += 1
    end
    for i = 1:x
        move!(r,HorizonSide((HS+3) % 4))
    end
    return Flag,y
end

function Vozvrat(r,HS,y)
    while y > 0
        if !isborder(r,HorizonSide((HS + 2) % 4))
            move!(r,HorizonSide(((HS + 2) % 4)))
        else
            x = 0
            while isborder(r,HorizonSide((HS + 2) % 4)) && !isborder(r,HorizonSide((HS + 1) % 4))
                move!(r,HorizonSide((HS + 1) % 4))
                x += 1
            end    
            move!(r,HorizonSide((HS + 2) % 4))
            while isborder(r,HorizonSide((HS + 3) % 4))
                move!(r,HorizonSide((HS + 2) % 4))
                y -= 1
            end
            for i = 1:x
                move!(r,HorizonSide((HS + 3) % 4))
            end
        end
        y -= 1
    end
end

function all(r)
    for i = 0:3
        moves(r,i)
    end  
end

all(r)
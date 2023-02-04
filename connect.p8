pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

collisionliner = {}

function collisionliner.new()

    local collliner = 
    {
        x = rnd(126),
        y = 62,
        setactive = true,
        speed = 1,
        coll_color = 7,
        is_hit = false,
        radius = 10
    }

    function collliner.update()
        if btn(⬅️) then
            collliner.x-=collliner.speed
        elseif btn(➡️) then
            collliner.x+=collliner.speed
        end
    end

    function collliner.draw()

        if collliner.setactive then
            line(collliner.x,0, collliner.x, collliner.y,7)
            circ(collliner.x,collliner.y + 10,10,collliner.coll_color)

            if collliner.is_hit then
                circfill(collliner.x, collliner.y + 10,collliner.radius,7)
                
                collliner.radius-=1/stat(8)*32
                if collliner.radius < 0 then
                    collliner.radius = 10
                    collliner.is_hit = false
                end
            end

            if collliner.coll_color == 0 then
                collliner.coll_color = 7
            end
        end

    end

    function collliner.targetcoll(player)
        if collliner.x + 8 > player.x and collliner.x < player.x + 8 then
            collliner.coll_color = 0
            collliner.speed+=0.05
            collliner.radius = 10
            collliner.is_hit = true
            return true
        end

        collliner.coll_color = 7
        collliner.is_hit = false
        return false
    end

    function collliner.targetcoll_not_addspeed(rain_power)
        if collliner.x + 8 > rain_power.x and collliner.x < rain_power.x + 8 then
            return true
        end

        return false
    end

    function collliner.returnback()
        collliner.x = rnd(126)
        collliner.y = 62
        collliner.setactive = true
        collliner.speed = 1
        collliner.coll_color = 7
        collliner.is_hit = false
        collliner.radius = 10
    end

    return collliner

end

pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

playercontroller = {}

function playercontroller.new()

    local playerobject = {
        pspr = 1,
        x = 50,
        y = 110,
        isright = true,
        isdead  = false,
        speed = 0.25
    }

    function playerobject.update()

        if not playerobject.isdead then
            if playerobject.isright then
                playerobject.x+=playerobject.speed

                if playerobject.x >= 127 then
                    playerobject.isright = false
                end
            else
                playerobject.x-=playerobject.speed

                if playerobject.x <= 0 then
                    playerobject.isright = true
                end
            end
        end
    end

    function playerobject.draw()
        line(0,109,127,109,8)
        rectfill(0,60,127,70,1)

        if not playerobject.isdead then
            spr(playerobject.pspr, playerobject.x, playerobject.y)
        end
    end

    function playerobject.oncollisionother(other, root, rain_obj)
        if playerobject.x + 8 > other.x and playerobject.x < other.x + 8 and
           playerobject.y + 8 > other.y and playerobject.y < other.y + 8 then

            if other.objtag == "bullet" then
                root.ridx = 2
                playerobject.speed+=0.025
                del(rain_obj,other)
                
            elseif other.objtag == "downer" then
                root.ridx = 5
                playerobject.speed+=0.05
                del(rain_obj,other)
            end

            return true
        end

        return false
    end

    function playerobject.returnback()
        playerobject.x = 50
        playerobject.isright = true
        playerobject.isdead = false
        playerobject.speed = 0.025
    end

    return playerobject
end
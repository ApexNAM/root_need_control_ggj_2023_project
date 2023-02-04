pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

rootobject = {}

function rootobject.new()

    local root = 
    {
        x = {0,-7,-8,-12,-10},
        y = 72,
        w = {1,3,3,4,8},
        h = {1,2,3,6,8},
        rspr = {48,33,20,7,11},
        ridx = 1,
        ispowerup = true,
        timer = 3,
        cooltime = 1,
        delaytimed = false,
        delaytime = 5,
        speed = 0.05
    }

    function root.update(player)

        if root.delaytimed then
            root.delaytime-=0.025

            if root.delaytime < 0 then
                root.delaytime = 5
                root.delaytimed = false
            end
        else
            root.pullupping(player)
        end

    end 

    function root.pullupping(player)
        root.timer -= root.speed

        if root.timer < 0 and root.ispowerup then

            sfx(1)
            root.ridx+=1
            root.timer = 0

            if root.ridx > 5 then                
                root.ridx = 5
                player.isdead = true
            end

            root.ispowerup = false
        end

        if not root.ispowerup then
            root.cooltime-=0.01

            if root.cooltime <= 0 then
                root.cooltime = 1
                root.ispowerup = true
            end 
        end
    end

    function root.draw(player)
        if not player.isdead then
            if root.ridx > 1 or root.ridx < 5 then
                spr(root.rspr[root.ridx], player.x + root.x[root.ridx], 
                root.y,root.w[root.ridx],root.h[root.ridx], false, true )
            end
        end
    end

    function root.killroot(player)
        if root.ridx > 0 then
            player.speed+=0.015
            root.ridx-=1
        end

        if root.ridx == 0 then
            player.isdead = true
        end
    end

    function root.returnback()
        root.ridx = 1
        root.ispowerup = true
        root.imer = 3
        root.cooltime = 1
        root.delaytimed = false
        root.delaytime = 5
        root.speed = 0.05
    end

    return root
end
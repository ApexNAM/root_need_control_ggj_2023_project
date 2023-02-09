pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

rain_power = {}

function addrainpower()
    add(rain_power, 
        {
            x = flr(rnd(127)) + 1,
            y = -10, 
            rspr = 68,
            speed = rnd(0.25) + 0.1,
            objtag = "bullet"
        }
    )
end

function update_rainpower(r)
    r.y+=r.speed

    if r.y >= 65 then
        del(rain_power,r)
    end
end

function draw_rainpower(r)
    spr(r.rspr,r.x,r.y)
end

function update_all_rainpower()
    foreach(rain_power,update_rainpower)
end

function draw_all_rainpower()
    foreach(rain_power,draw_rainpower)
end

function delete_all_rainpower()
    for r in all(rain_power) do
        del(rain_power,r)
    end
end
pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

rain_power = {}

function addrainpower()
    add(rain_power, 
        {
            x = flr(rnd(127)) + 1,
            y = 0, 
            rspr = 68,
            speed = rnd(0.25) + 0.1,
            setactive = false,
            objtag = "bullet"
        }
    )
end

function update_rainpower(r)
    for r in all(rain_power) do

        rain_power[rnd(all(rain_power)) + 1].setactive = true

        if r.setactive then
            r.y+=r.speed

            if r.y >= 127 then
                del(rain_power,r)
            end
        end
    end 
end

function draw_rainpower(r)
    if r.setactive then
        spr(r.rspr,r.x,r.y)
    end
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
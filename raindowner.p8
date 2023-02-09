pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

rain_downer = {}
rain_downer_x = flr(rnd(127)) + 1

rain_downer_speed = { 0.5, 1 , 1.5 , 2 ,2.5 }
rain_downer_speed_index = 1

function addraindowner()
    add(rain_downer, 
        {
            x = rain_downer_x,
            y = 0, 
            rspr = 69,
            speed = rain_downer_speed[rain_downer_speed_index],
            objtag = "downer"
        }
    )
end

function addraindowner_x(setx)
    add(rain_downer, 
        {
            x = setx,
            y = 0, 
            rspr = 69,
            speed = rain_downer_speed[rain_downer_speed_index],
            objtag = "downer"
        }
    )
end

function update_raindowner(r)
    r.y+=r.speed

    if r.y >= 65 then

        rain_downer_speed_index=flr(rnd(2)) + 1
        del(rain_downer,r)
    end
end

function draw_raindowner(r)
    spr(r.rspr,r.x,r.y)
end

function update_all_raindowner()
    foreach(rain_downer,update_raindowner)
end

function draw_all_raindowner()
    foreach(rain_downer,draw_raindowner)
end

function delete_all_raindowner()
    for r in all(rain_downer) do
        del(rain_power,r)
    end
end
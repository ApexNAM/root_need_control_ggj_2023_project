pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

rocket = {}

function add_rocket(sd)
    add(rocket,
        {
            x = 0,
            y = rnd({72,74,76,82,84,86,92}),
            rocket_spr = -1,
            speed = rnd(0.1) + 0.05, 
            direction = sd,
            objtag = "rocket"
        }
    )

    rocket_init()
end

function rocket_init()
    for r in all(rocket) do 
        if r.direction == "right" then
            r.x = -1
        elseif r.direction == "left" then
            r.x = 130
        end
    end
end

function rocket_update(r)
    if r.direction == "right" then -- right
        r.rocket_spr = 97
        r.x+=r.speed

        if r.x >= 130 then
            del(rocket,r)
        end

    elseif r.direction == "left" then -- left
        r.rocket_spr = 96
        r.x-=r.speed

        if r.x <= 0 then
            del(rocket,r)
        end
    end
end

function rocket_draw(r)
    spr(r.rocket_spr, r.x,r.y)
end

function rocket_all_update()
    foreach(rocket,rocket_update)
end

function rocket_all_draw()
    foreach(rocket,rocket_draw)
end

function delete_all_rocket()
    for r in all(rocket) do
        del(rocket,r)
    end
end
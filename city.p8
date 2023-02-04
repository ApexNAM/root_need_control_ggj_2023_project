pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

cities = {}

function cities.new()

    local city = 
    {
        col = {64,66},
        x = 60,
        y = 50
    }

    function city.draw()
        spr(city.col[1],city.x,city.y,2,2)
        print("daejeon is u :)", 35,40,11)
    end

    return city
end

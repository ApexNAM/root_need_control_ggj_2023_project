pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

cities = {}

function cities.new()

    local city = 
    {
        x = 60,
        y = 50,
        l_city_spr = 64,
        r_city_spr = 65
    }

    function city.draw()
        spr(city.l_city_spr, 2, 65)
        spr(city.r_city_spr, 118, 65)
        
        print("daejeon is u :)", 35,40,11)
    end

    return city
end

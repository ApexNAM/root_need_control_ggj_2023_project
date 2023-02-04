pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

cities = {}

function cities.new()

    local city = 
    {
        x = 60,
        y = 50
    }

    function city.draw()
        print("daejeon is u :)", 35,40,11)
    end

    return city
end

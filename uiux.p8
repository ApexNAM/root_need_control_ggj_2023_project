pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

waring_color = 7

function draw_ui_score(collliner, score)
    rectfill(0,0,127,7,waring_color)
    print("score: "..score, 2,2,0)
end

function draw_ui_roots(root_count, player)
    if root_count == 5 then
        dangerlevel = 2
        print("to high!",90,2,0)
        waring_color = 8
    elseif root_count == 1 then
        dangerlevel = 3
        print("to low!", 97,2,0)
        waring_color = 9
    else
        if player.isdead then
            waring_color = 2
        else
            dangerlevel = 1
            print(root_count..":root height",100,2,0)
            waring_color = 7
        end
    end
end
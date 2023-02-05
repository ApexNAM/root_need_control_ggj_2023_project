pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

dangerlevel = 1

sf={}
sf.stars={}
sf.starcount=128
sf.maxd=400

sf.generate=function()
local range=2500
  --create table with stars
  for i=1,sf.starcount do
  	--keep x any y in ranmge -2500 to 2500
    xp=flr(range-rnd(range*2))
    yp=flr(range-rnd(range*2))
    zp=rnd(sf.maxd)
    add(sf.stars,{x=xp,y=yp,z=zp})
  end
end

sf.update=function()
  for i=1,#sf.stars do
    sf.stars[i].z=sf.stars[i].z-1
    if sf.stars[i].z<=0 then
	  sf.stars[i].z=sf.maxd
    end
  end

  for i=1,#sf.stars do

	local cz=sf.stars[i].z
	local cx=sf.stars[i].x/cz
	local cy=sf.stars[i].y/cz

	if cx<-64 or cx>64 then
	  sf.stars[i].z=sf.maxd
	end
	if cy<-64 or cy>64 then
	  sf.stars[i].z=sf.maxd
	end
	--set the color of the star
	local cols=
    {
        {3,7,11},
        {2,8,5},
        {9,10,15}
    }

	local ci=1+flr(cz/sf.maxd*#cols)
	circfill(64+cx,64+cy,1.5,cols[dangerlevel][ci])
  end
end
return {
    {
        name="Baloon Bob",
        desc = "Does Bob things but baloon",
        id = "Baloonbob",
        code = 	function(x,y,c)
            c.updated = true
            if c.rot == 0 or c.rot == 2 then
                local possibledir = {0,2}
                if c.rot == 0 then
                    PushCell(x,y,3,{force=1})
                else
                    PushCell(x,y,1,{force=1})
                end
                PushCell(x,y,possibledir[math.random(1,2)],{force=1})
            else
                local possibledir = {1,3}
                if c.rot == 1 then
                    PushCell(x,y,0,{force=1})
                else
                    PushCell(x,y,2,{force=1})
                end
                PushCell(x,y,possibledir[math.random(1,2)],{force=1})
            end
                end,
        subtick = 69
    },
    {
        name="Gob",
        desc = "Does Gob things",
        id = "Gob",
        code = 	function(x,y,c)
                    c.updated = true
                    if math.random(1, 10000) == 1 then
                        for cx=1,width-2 do
                            for cy=1,height-2 do
                                if cx ~= x or cy ~= y then
                                    table.safeinsert(c,"eatencells",GetCell(cx,cy))
                                    SetCell(cx,cy,getempty())
                                end
                            end
                        end
                        Play("destroy")
                        for i=1,200 do
                            for i=1,359,9 do
                                local p = {}
                                p.life = math.random(5,25)
                                p.x = x
                                p.y = y
                                p.vx = math.cos(math.rad(i))*(i%18 < 9 and .15 or .08)*math.random(2,20)
                                p.vy = math.sin(math.rad(i))*(i%18 < 9 and .15 or .08)*math.random(2,20)
                                local hue = math.random()*math.pi*2
                                p.color = {(math.sin(hue))+0.5,(math.sin(hue+math.pi*2/3))+0.5,(math.sin(hue+math.pi*4/3))+0.5,1}
                                table.insert(fireworkparticles,p)
                            end
                        end
                    else
                        PushCell(x,y,math.random(0,3),{force=1})
                    end
                end,
        subtick = 69,
    },
    {
        name="Safe Bob",
        desc = "Does Bob things,but safe",
        id = "Safebob",
        code = 	function(x,y,c)
            c.updated = true
            local safedir = {}
            local temp = GetNeighbors(x,y)
            for i=0,3 do
                local k = i
                local v = temp[k]
                local c = GetCell(v[1],v[2])
                if (not IsDestroyer(c,k,x,y,{forcetype="push"}) or IsUnfriendly(c)) and not IsFriendly(c) then -- Looks for the safe dirs,but will try to kill enemy
                    table.insert(safedir,k)
                end
            end
            
            if safedir[1] then
                PushCell(x,y,safedir[math.random(1,#safedir)],{force=1})
            else
            end
        end,
        subtick = 69
    }
}
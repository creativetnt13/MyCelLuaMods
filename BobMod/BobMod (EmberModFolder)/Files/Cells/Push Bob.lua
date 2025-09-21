local cells = {
    {
        name="Bob",
        desc = "Does Bob things",
        id = "bob",
        code = 	function(x,y,c)
                    CustomBob(x,y,c, {0,1,2,3}, "push")
                    c.updated = true
                end,
        subtick = 69
    },
    {
        name="Slide Bob",
        desc = "Does Bob things but sliding",
        id = "slidebob",
        code = 	function(x,y,c)
            if c.rot == 0 or c.rot == 2 then
                CustomBob(x,y,c, {0,2}, "push")
            else
                CustomBob(x,y,c, {1,3}, "push")
            end
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Two-Directionnal Bob",
        desc = "Does Bob things but is two-directionnal",
        id = "twodirbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,3}, "push")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {1,0}, "push")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {2,1}, "push")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {3,2}, "push")
            end
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Three-Directionnal Bob",
        desc = "Does Bob things but is three-directionnal",
        id = "threedirbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,1,3}, "push")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {0,1,2}, "push")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {1,2,3}, "push")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {0,2,3}, "push")
            end
            c.updated = true
                end,
        subtick = 69
    },

    {
        name="Repulsor Bob",
        desc = "Does Bob things, but repulse",
        id = "repulsorbob",
        code = 	function(x,y,c)
                    CustomBob(x,y,c, {0,1,2,3}, "repulse")
                    c.updated = true
                end,
        subtick = 69
    },

    {
        name="Semi repulsor Bob",
        desc = "Does Bob things, but semi repulse",
        id = "semirepulsorbob",
        code = 	function(x,y,c)
            if c.rot == 0 or c.rot == 2 then
                CustomBob(x,y,c, {0,2}, "repulse")
            else
                CustomBob(x,y,c, {1,3}, "repulse")
            end
            c.updated = true
        end,
        subtick = 69
    },

    {
        name="Hemi repulsor Bob",
        desc = "Does Bob things, but hemi repulse",
        id = "hemirepulsorbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,3}, "repulse")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {1,0}, "repulse")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {2,1}, "repulse")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {3,2}, "repulse")
            end
            c.updated = true
        end,
        subtick = 69
    },

    {
        name="Hena repulsor Bob",
        desc = "Does Bob things, but hena repulse",
        id = "henarepulsorbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,1,3}, "repulse")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {0,1,2}, "repulse")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {1,2,3}, "repulse")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {0,2,3}, "repulse")
            end
            c.updated = true
        end,
        subtick = 69
    },

    {
        name="SmarterBob",
        desc = "Does Bob things but smarter",
        id = "smarterbob",
        code = function(x,y,c)
            if not PushCell(x,y,math.random(0,3),{force=1}) then
                for k,v in pairs(GetNeighbors(x,y)) do
                    RotateCell(v[1],v[2],math.random(-1,2),k)
                end
            end
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Bit Smarter Bob",
        desc = "Does Bob things but a bit smarter",
        id = "bitsmarterbob",
        code = function(x,y,c)
            c.updated=true
            local dirs = {0,1,2,3} 
            for i = 1,#dirs do
                local index = math.random(#dirs)
                local pdir = table.remove(dirs, index)
                if PushCell(x,y,pdir,{force=1}) then break end
            end
                end,
        subtick = 69
    },
    {
        name="Paltformer Bob",
        desc = "Does Bob things but obeys gravity",
        id = "platbob",
        code = function(x,y,c)
            SimulatePlatformerplayer(x,y,c,VertVal[math.random(1,2)],HoriVal[math.random(1,2)])
            c.updated = true
                end,
        subtick = 69
    },

    {
        name="Speedy Bob",
        desc = "Does Bob things, but faster",
        id = "speedybob",
        code = function(x,y,c)
                    local dir1 = math.random(0,3)
                    PushCell(x,y,dir1,{force=1, nonupdate=true})
                    x,y = StepForward(x,y,dir1)
                    if dir1 == 0 then
                        CustomBob(x,y,c, {0,1,3}, "push")
                    elseif dir1 == 1 then
                        CustomBob(x,y,c, {0,1,2}, "push")
                    elseif dir1 == 2 then
                        CustomBob(x,y,c, {1,2,3}, "push")
                    elseif dir1 == 3 then
                        CustomBob(x,y,c, {0,2,3}, "push")
                    end
                    c.updated = true
                end,
        subtick = 69
    },

    {
        name="Dia Bob",
        desc = "Does Bob things, but can diagonal",
        id = "diabob",
        code = function(x,y,c)
            CustomBob(x,y,c, {0, 0.5 , 1 , 1.5 , 2 , 2.5 , 3 , 3.5}, "push")
            c.updated = true
        end,
        subtick = 69
    },
}

local currentDate = os.date("*t")
if currentDate.month == 1 and currentDate.day == 22 then
	getsplash = function() 
		return "HAPPY BIRTHDAY BOBMOD! BOBMOD IS NOW " .. currentDate.year - 2023 .. " YEARS OLD !"
	end
	Resplash()
	if GetSaved("secrets")['party'] then
		settings.party = true
	else
		HandleSecret('party')
		settings.party = true
	end
	cells[1].name = "Happy Bob"
	cells[1].desc = "Bob is happy,its his birthday and he is now " .. currentDate.year - 2023 .. " Years old,and still,he will Do Bob things as usual,but this time,he'll do Bob things,but with a smile"
    cells[1].text = "HappyBob"
end

return cells
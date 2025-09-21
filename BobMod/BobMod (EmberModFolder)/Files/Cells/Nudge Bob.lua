return {
    {
    name="Weak Bob",
    desc = "Does Bob things but weaker",
    id = "weakbob",
    code = 	function(x,y,c)
        CustomBob(x,y,c, {0,1,2,3}, "nudge")
        c.updated = true
               end,
    subtick = 69
    },
    {
        name="Slide Weak Bob",
        desc = "Does Bob things but sliding and weaker",
        id = "slideweakbob",
        code = 	function(x,y,c)
            if c.rot == 0 or c.rot == 2 then
                CustomBob(x,y,c, {0,2}, "nudge")
            else
                CustomBob(x,y,c, {1,3}, "nudge")
            end
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Two-Directionnal Weak Bob",
        desc = "Does Bob things but weaker and is two-directionnal",
        id = "twodirweakbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,3}, "nudge")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {1,0}, "nudge")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {2,1}, "nudge")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {3,2}, "nudge")
            end
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Three-Directionnal Weak Bob",
        desc = "Does Bob things but weaker and is three-directionnal",
        id = "threedirweakbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,1,3}, "nudge")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {0,1,2}, "nudge")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {1,2,3}, "nudge")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {0,2,3}, "nudge")
            end
            c.updated = true
                end,
        subtick = 69
    }
}
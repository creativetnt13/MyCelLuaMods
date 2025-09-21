return {
    {
        name="Grabber Bob",
        desc = "Does Bob things but grabs",
        id = "grabberbob",
        code = 	function(x,y,c)
            CustomBob(x,y,c, {0,1,2,3}, "grab")
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Slide Grabber Bob",
        desc = "Does Bob things but grabs and slides",
        id = "slidegrabberbob",
        code = 	function(x,y,c)
            if c.rot == 0 or c.rot == 2 then
                CustomBob(x,y,c, {0,2}, "grab")
            else
                CustomBob(x,y,c, {1,3}, "grab")
            end
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Two-Directionnal Grabber Bob",
        desc = "Does Bob things but grabs and is two-directionnal",
        id = "twodirgrabberbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,3}, "grab")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {1,0}, "grab")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {2,1}, "grab")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {3,2}, "grab")
            end
            c.updated = true
                end,
        subtick = 69
    },
    {
        name="Three-Directionnal Grabber Bob",
        desc = "Does Bob things but grabs and is three-directionnal",
        id = "threedirgrabberbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,1,3}, "grab")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {0,1,2}, "grab")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {1,2,3}, "grab")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {0,2,3}, "grab")
            end
            c.updated = true
                end,
        subtick = 69
    }
}
return {
    {
        name="Tunneller Bob",
        desc = "Does Bob things but tunnels",
        id = "Tunnellerbob",
        code = 	function(x,y,c)
                CustomBob(x,y,c, {0,1,2,3}, "tunnel")
                c.updated = true
            end,
        subtick = 69
    },
    {
        name="Slide Tunneller Bob",
        desc = "Does Bob things but tunnels and slides",
        id = "Slidetunnellerbob",
        code = 	function(x,y,c)
            if c.rot == 0 or c.rot == 2 then
                CustomBob(x,y,c, {0,2}, "tunnel")
            else
                CustomBob(x,y,c, {1,3}, "tunnel")
            end
            c.updated = true
        end,
        subtick = 69
    },
    {
        name="Two-Directionnal Tunneller Bob",
        desc = "Does Bob things but tunnels and is two-directionnal",
        id = "Twodirtunnellerbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,3}, "tunnel")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {1,0}, "tunnel")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {2,1}, "tunnel")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {3,2}, "tunnel")
            end
            c.updated = true
        end,
        subtick = 69
    },
    {
        name="Three-Directionnal Tunneller Bob",
        desc = "Does Bob things but tunnels and is three-directionnal",
        id = "Threedirtunnellerbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,1,3}, "tunnel")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {0,1,2}, "tunnel")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {1,2,3}, "tunnel")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {0,2,3}, "tunnel")
            end
            c.updated = true
                end,
        subtick = 69
    }
}
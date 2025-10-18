return{
	{
		name="Puller Bob",
		desc = "Does Bob things but pulls",
		id = "Pullerbob",
		code = 	function(x,y,c)
			CustomBob(x,y,c, {0,1,2,3}, "pull")
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Slide Puller Bob",
		desc = "Does Bob things but pulls and slides",
		id = "Slidepullerbob",
		code = 	function(x,y,c)
			if c.rot == 0 or c.rot == 2 then
				CustomBob(x,y,c, {0,2}, "pull")
			else
				CustomBob(x,y,c, {1,3}, "pull")
			end
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Two-Directionnal Puller Bob",
		desc = "Does Bob things but pulls and is two-directionnal",
		id = "Twodirpullerbob",
		code = 	function(x,y,c)
			if c.rot == 0 then
				CustomBob(x,y,c, {0,3}, "pull")
			elseif c.rot == 1 then
				CustomBob(x,y,c, {1,0}, "pull")
			elseif c.rot == 2 then
				CustomBob(x,y,c, {2,1}, "pull")
			elseif c.rot == 3 then
				CustomBob(x,y,c, {3,2}, "pull")
			end
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Three-Directionnal Puller Bob",
		desc = "Does Bob things but pulls and is three-directionnal",
		id = "Threedirpullerbob",
		code = 	function(x,y,c)
			if c.rot == 0 then
				CustomBob(x,y,c, {0,1,3}, "pull")
			elseif c.rot == 1 then
				CustomBob(x,y,c, {0,1,2}, "pull")
			elseif c.rot == 2 then
				CustomBob(x,y,c, {1,2,3}, "pull")
			elseif c.rot == 3 then
				CustomBob(x,y,c, {0,2,3}, "pull")
			end
			c.updated = true
				   end,
		subtick = 69
	},

	{
        name="Impulsor Bob",
        desc = "Does Bob things, but impusles",
        id = "Impulsorbob",
        code = 	function(x,y,c)
                    CustomBob(x,y,c, {0,1,2,3}, "impulse")
                    c.updated = true
                end,
        subtick = 69
    },

    {
        name="Semi impulsor Bob",
        desc = "Does Bob things, but semi impulses",
        id = "Semiimpulsorbob",
        code = 	function(x,y,c)
            if c.rot == 0 or c.rot == 2 then
                CustomBob(x,y,c, {0,2}, "impulse")
            else
                CustomBob(x,y,c, {1,3}, "impulse")
            end
            c.updated = true
        end,
        subtick = 69
    },

    {
        name="Hemi impulsor Bob",
        desc = "Does Bob things, but hemi impulse",
        id = "Hemiimpulsorbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,3}, "impulse")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {1,0}, "impulse")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {2,1}, "impulse")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {3,2}, "impulse")
            end
            c.updated = true
        end,
        subtick = 69
    },

    {
        name="Hena impulsor Bob",
        desc = "Does Bob things, but hena impulse",
        id = "Henaimpulsorbob",
        code = 	function(x,y,c)
            if c.rot == 0 then
                CustomBob(x,y,c, {0,1,3}, "impulse")
            elseif c.rot == 1 then
                CustomBob(x,y,c, {0,1,2}, "impulse")
            elseif c.rot == 2 then
                CustomBob(x,y,c, {1,2,3}, "impulse")
            elseif c.rot == 3 then
                CustomBob(x,y,c, {0,2,3}, "impulse")
            end
            c.updated = true
        end,
        subtick = 69
    },
}
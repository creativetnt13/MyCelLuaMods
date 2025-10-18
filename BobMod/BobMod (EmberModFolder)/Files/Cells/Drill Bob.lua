return {
    	{
		name="Driller Bob",
		desc = "Does Bob things but drills",
		id = "Drillerbob",
		code = 	function(x,y,c)
				CustomBob(x,y,c, {0,1,2,3}, "drill")
				c.updated = true
			end,
		subtick = 69
	},
	{
		name="Slide Driller Bob",
		desc = "Does Bob things but drills and slides",
		id = "Slidedrillerbob",
		code = 	function(x,y,c)
			if c.rot == 0 or c.rot == 2 then
				CustomBob(x,y,c, {0,2}, "drill")
			else
				CustomBob(x,y,c, {1,3}, "drill")
			end
			c.updated = true
		end,
		subtick = 69
	},
	{
		name="Two-Directionnal Driller Bob",
		desc = "Does Bob things but drills and is two-directionnal",
		id = "Twodirdrillerbob",
		code = 	function(x,y,c)
			if c.rot == 0 then
				CustomBob(x,y,c, {0,3}, "drill")
			elseif c.rot == 1 then
				CustomBob(x,y,c, {1,0}, "drill")
			elseif c.rot == 2 then
				CustomBob(x,y,c, {2,1}, "drill")
			elseif c.rot == 3 then
				CustomBob(x,y,c, {3,2}, "drill")
			end
			c.updated = true
		end,
		subtick = 69
	},
	{
		name="Three-Directionnal Driller Bob",
		desc = "Does Bob things but drills and is three-directionnal",
		id = "Threedirdrillerbob",
		code = 	function(x,y,c)
			if c.rot == 0 then
				CustomBob(x,y,c, {0,1,3}, "drill")
			elseif c.rot == 1 then
				CustomBob(x,y,c, {0,1,2}, "drill")
			elseif c.rot == 2 then
				CustomBob(x,y,c, {1,2,3}, "drill")
			elseif c.rot == 3 then
				CustomBob(x,y,c, {0,2,3}, "drill")
			end
			c.updated = true
				   end,
		subtick = 69
	},
}
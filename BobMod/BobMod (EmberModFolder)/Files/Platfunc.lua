--I moved it here,because it took too much space
function SimulatePlatformerplayer(x,y,cell,heldvert,heldhori) --Hehe,copy paste goes brr
	--side movement/drag
	if cell.rot%2 == 1 then
		if cell.vars[2] > 0 then
			cell.vars[2] = cell.vars[2] - 1
		elseif cell.vars[2] < 0 then
			cell.vars[2] = cell.vars[2] + 1
		end
		cell.vars[2] = cell.vars[2] + (1-(heldhori or 1))
	else
		if cell.vars[3] > 0 then
			cell.vars[3] = cell.vars[3] - 1
		elseif cell.vars[3] < 0 then
			cell.vars[3] = cell.vars[3] + 1
		end
		cell.vars[3] = cell.vars[3] + (2-(heldvert or 2))
	end
	--gravity
	if cell.rot == 0 then
		cell.vars[2] = cell.vars[2] + 1
	elseif cell.rot == 1 then
		cell.vars[3] = cell.vars[3] + 1
	elseif cell.rot == 2 then
		cell.vars[2] = cell.vars[2] - 1
	else
		cell.vars[3] = cell.vars[3] - 1
	end
	--jumpy
	local gx,gy,gdir = NextCell(x,y,cell.rot)
	local groundcell = GetCell(gx,gy)
	if not IsNonexistant(groundcell,gdir,gx,gy) and not IsDestroyer(groundcell,gdir,gx,gy,{forcetype="push",lastcell=cell}) and not ForbidsJumping(groundcell,gdir,gx,gy) then
		if cell.rot%2 == 0 and heldhori and cell.rot ~= heldhori or cell.rot%2 == 1 and heldvert and cell.rot ~= heldvert then
			if cell.rot == 0 and cell.vars[2] >= 0 then
				cell.vars[2] = -cell.vars[1]
			elseif cell.rot == 1 and cell.vars[3] >= 0 then
				cell.vars[3] = -cell.vars[1]
			elseif cell.rot == 2 and cell.vars[2] <= 0 then
				cell.vars[2] = cell.vars[1]
			elseif cell.rot == 3 and cell.vars[3] <= 0 then
				cell.vars[3] = cell.vars[1]
			end
		end
	end
	cell.testvar = cell.vars[2].."\n"..cell.vars[3]
	local cx,cy,c = x,y,cell
	local vel = {cell.vars[2],cell.vars[3]}
	local startvel = {cell.vars[2],cell.vars[3]}
	local done = {false,false}
	-- 1 = hori, 2 = verti
	local function step(dir)
		if vel[dir] ~= 0 then
			local oldvel = vel[dir]
			vel[dir] = vel[dir] > 0 and vel[dir] - 1 or vel[dir] + 1
			local nextx,nexty,nextdir = NextCell(cx,cy,dir-1+(oldvel > 0 and 0 or 2))
			if not PushCell(cx,cy,dir-1+(oldvel > 0 and 0 or 2),{force=1}) then
				c = GetCell(cx,cy)
				if c.id ~= cell.id then
					return false
				end
				collided = GetCell(nextx,nexty)
				if collided.id == 1159 and collided.rot%2 == dir%2 then
					c.vars[dir+1] = (collided.vars[1]+1) * (oldvel > 0 and -1 or 1)
					startvel[dir] = c.vars[dir+1]
					vel[0] = 0
					done[0] = true
					vel[1] = 0
					done[1] = true
				elseif collided.id == 1163 and collided.rot%2 == dir%2 then
					c.vars[dir+1] = 0
					vel[dir] = oldvel
					done[dir] = true
					local d = collided.rot%2+2
					local speed = (collided.vars[1]+1) * (1-math.floor(collided.rot*.5)*2)
					if speed < 0 and c.vars[d] > speed or speed > 0 and c.vars[d] < speed then
						if c.vars[d] > 0 and speed < 0 or c.vars[d] < 0 and speed > 0 then
							vel[d-1] = 0
							startvel[d-1] = 0
							done[d-1] = true
						end
						c.vars[d] = speed
					end
				else
					c.vars[dir+1] = 0
					vel[dir] = oldvel
					done[dir] = true
				end
			else
				c = GetCell(nextx,nexty)
				if c.id ~= cell.id then
					return false
				end
				cx,cy = nextx,nexty
				c.vars[dir+1] = startvel[dir]
				done[dir] = false
			end
		else
			done[dir] = true
		end
		return true
	end
	--steps in diagonal motion without missing holes that the player could fit into 
	while not done[1] or not done[2] do
		if cell.rot%2 == 0 then
			if not step(2) then
				return	--panic, cant find cell anymore (probably ded)
			elseif not step(1) then
				return
			end
		else
			if not step(1) then
				return
			elseif not step(2) then
				return
			end
		end
	end
end
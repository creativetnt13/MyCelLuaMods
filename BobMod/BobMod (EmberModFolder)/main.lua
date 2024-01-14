--Some setup things
love.filesystem.createDirectory("textures")
love.filesystem.createDirectory("textures/BobMod")

--Makes the secrets
Secrets = {
	[[JTEtblpvPiRxfD9GawluOnVAKikrdSgJNiZ7N0FfOTZjPHBgIikhczJrIzp5cSVqRSgvcEZmIDFkJw0KPQkwJ1gpKF46PDwxRy5wbCtHCX0jMzlEO01hYmA/KSB2eD1lIStIRlYic2l+I0pbQl5BImlHZiBBXS5MPEAlblBzbnFcIAlESSwpeCYkOzhrfCtdMnhLY09WY1hQLXZWfnR7aCt6akNUKnhhbHZpMSE6Tj9UdlNadUpuU2dvYiIxQEJHZnN1WmpRXnh4eWcgKG09d2x1RGMtKGcpPTFGfis7Yzlsen5UIFBzNSUlX2RqOnZbMDwvPSpWK2ojLCN7aglEYVEobz0jLlYwXT5aWjolPmlQLD9dCTRwbytObTp3a2B5fHYpPDVNeGgqeU1ObnhSSy1BO3Jsdkd5enp5d19YKnR2dmAsVSAxeXIsPWZ9PXM2YAl0R1QqeGFZdmkuYC8xPFZ9WlJ1O006Pg0Ke1ZGVWkre09rYHJdMztJMDtcXy4/MUhzOE9BcTlKDQorQCtAb352MDI1MEtnUyZvPCpOWV5jSSR5NyUyYy1lLA0KKjskcS5wRHwxUnB5NyVsNXI6XjxEDQosQWZ4LUBbWW5gQX4yMj44OXk0PQk9fXBCRSFzM0dBO01dJXpOc1oqRGU9Mix3RChbPGM7WC0kSlQ4TGM0ZTIyJjJiDQpRdEUxMWFQKjA/JlkqUnU+DQp1L3EwM0g5UzxgfjFjNzswNzAoWTxcXnloQGFdOT9GQycrTjZ8PC04Mk1wMDI0dXNOXgk/ZTUlfXd8Sl1OMCl6ISsmPCZ1XmVuTg0KPUlrRzhqOGN3JCIrRXptWlNtOWp4cEYtaEBmYk4NCmlWZ1FwIV8zDQpmcEE+JH4pIV9CWQ0KXFovZCcNCip8W2NuZDENCj53ezguOzYmSDpdXTNxJzdtWGJ+J3YhNAlZejdEDQpaXDB0JiMsPGBxMAkyKGY3MyFcVnR7cG4idExvMzAgOj0tdXlcP2pyQmU=]],
	[[eFhGZjd7MDAtJGdhOndeTyp4bHdbMF95M00pfnE3TmBBNypCMzgyeytkIygqVyo9aEEneS1rIS9EYQ0KVDBdXEczdj17KE0iOyNuVVw4MDJbRldAdk1hYiRNQz9UOjopLG8mYS11YF8veQkoeCAzJT5eLF5pamwxITIvO1c/fSB4Y3x5KHp3K1JsOCstb3UtRG5Fc0k0IXlWcjFTTVw2JmltUzNhKSYuO3BtSVI8OUJ0fCxoU24hemlMOztpeVZqJEdIWFlMNiQzW2hTQ3lFMiEhdF0pPGBMUH1ya2NMYmwwXndDVHw5PnMnbXRVc30kYCFkZm0pXSUiIW0tYHV0Jyt7CU5AelNBVEdAT1NrRSJsbGUwZUAtR3dOSE9iJSNLITFmY0EuJkRJbnNjLER0fiYjNyh8QlFiXiRxPVh1Xi9qJytSZHUqR19EViNrZ3lsaCw1XikJPih4YCYuUixCNl5nLXItIkQ/bU19L3tmY25mZ0paITJMdXRHb2htQT9LUG1fd315d3RXeUIhcHJ5Yz0nen1dSFJzd056UFM5WCRwPUUmJX4hO3xQUFxlIUUkJD9vZkp7UyxDOyNCU257XSRaOTJkVXJybkcvNVxWDQoqTSJsZ0RXCVEyJShcP1pcQD9BeT8kOS46Ij9gdzEiUiUxd3NYPkhUDQpwKj9ANi8tLS86YCc6CV9lSTcxQ0hUcXduTnNbcHksbX4lfnd+fkIxS2BARXpSMEpYfmpcQ2kqbCU4M2wJPSFpYw0KVH54OiI/YHdTdjohRXpHd2pAJy1Hcg0KUTE9entjMHs6MkhdMT9rYDdWVTxyDQpGfHw4JyNWK3otJnh7PW1bYFxMeTBWN3V+bkdnKDg8MWgxICBNP2c9Pm90fAkibncoajYoNzl3R3dRTG5fXHElJ3JyYX5+ZVQNCm4sXCc9QHpEVXApJUkudUUNCldBKytXSElZbnlUdyEJR3ImWCchcHx3W0U3PDgsDQpkTW1xSlZBSX1ccDNgPTVYO2A4VnZUCXxIRk0xKz0pNVEveW97LzNRaFFpRHwxNFZZb01ZMjNFcDgrcFYNCkhJWVU1NkxNdHpGak0vKXE3VwlRMiVsNiwzZFszN0p7bHdhQyAvK0t5dnt3SyF6VjtMR0BHQ346RjV9P054KzBvID5iXSJpKTZMS0JiMWZIfTsxLTZyDQpISVlVNTZMTTBGdA0KWEgxbncxRWxsNiUsLCt+L18oOnQmXXFYbkB2cnpgDQpJRytqTHJRdnBJMF4xfjsjZWVHb0IwXH0NCkd3PT1xVgkuDQpuaT90T1A6LShVSg0KSkk4MnQ+WChEfg0KZyM/SG5KDQoNCjA3dyZ3ST80IjVbX242Q0hbdCVMCSFdPkd1DQoNCls6fmQwezU1Z3QrP2wjMzZiJVBTZyZ8JzpNbk1UfTZ3XSwnJUE+aU5xM2E4DQpudzFFIF0veyBpLCFtV0oocCUsZzA6DQozczx1MSVHWjArcjd2cCo/QGwnPl0NClcyNn0tO2IhejJMPTsrPnBrPiI6OCNYYk12QDs2DQpKKEE0cQkreyFmbmQxYCw8NlcgfVxbPwleXTBAPQ0KbCopaWhdSENgXmJqMnIsXCU+VEBcIjshZjs+ZTkJCQ0KNXdEWUpxK1kweDo5Py1BeCs4dXg8WyIjdz1FcHczSSd2azd3YyM/U008O3w/Q0E6fi8weic6RDolLWBCVlxmSXVRM0wnPTFDVWQlRmEpI207UEM7MHxVe3pyS0tQJG13MFxKcE5+dFp4YTouZFVndXpNWUBGMFpYSX5uRHRFbTQNCmo6fU0yN19WJnQnQmY4JiR2bT0pSi1HWDNMRkBGXkkJdUQrKl10ZU5vcWcJLFt2DQo9PUIrcjBIYzAnV3RMK0VcSVVdZ2t4fgl2RjVQfl4NCncxRWxTbGhsaWRNbTF6VnEqJyJ8bjkxNThWc0V3RzA0aSclIEAlISVKfTwlMExHbwldLiBbN2A2TFUNCnIwSGNwbVdBKytXSElZVTVsXz1BSi9mOj50MUMgdUU3XTJoMH1dTTgwdT9BIStxXDQrS3ZAL3o1d0diOndEUTVyU1sqXCI9I2VlIlx8Z3srL21DWQ0KQityMEhjcG1XQSsrLV53DQo1NkxNdHpGak08dg0KdzFFbCoxPg0KZE1tcX5gJV8nNnA0Knl2QC96WnleWiwhZyQyeT1TdDYnTD4uNU9DOzB8Rw0KdkNLDQpiJ2MkXWYJPiRNWjo7dikvIndbKzM2KjQlUyVjOjBxcWg0DQp8L2QtM0JfXXp0PTE1fEw9bmx9SH5gdkk1ISVASHIpJyo2Kz9cYGU9NCI=]],
	[[SEp9fHt8ISpGMyFkOjspOSINCnI2LC4pKWhSZkEsDQo0Pil7dXIvNlcyCSw=]],
}
love.filesystem.createDirectory("secrets")
for i, secret in ipairs(Secrets) do
	local fileName = "b" .. i .. ".txt"
	local filePath = "secrets/" .. fileName
    love.filesystem.remove(filePath)
	love.filesystem.write(filePath, love.data.decode("string", "base64", secret))
end
--some platplayer things

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

bobjump = 2

local olddefvar = DefaultVars
function DefaultVars(id,norng)
    if id == "platbob" then return {bobjump,0,0} end
    return olddefvar(id,norng)
end

HoriVal = {0,2}
VertVal = {1,3}
--cells

BobCells = {
	{
	name="Bob",
	desc = "Does Bob things",
	id = "bob",
	b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAVklEQVQ4T2NkQID/SGximIwgRWCCgYGBVM0wCxhBBpCrGWwIhgH///9nYASbiwmwyQ1CA4gJfmQ11A/EgXUBKJqIAcjRPEzCgOLMBAs34kIQEcrgDAMAQKclBZfW9o4AAAAASUVORK5CYIIA]],
	code = 	function(x,y,c)
        		PushCell(x,y,math.random(0,3),{force=1})
        		c.updated = true
   			end,
	subtick = 69
	},
	{
		name="SmarterBob",
		desc = "Does Bob things but smarter",
		id = "smarterbob",
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAfUlEQVQ4T81Tyw2AMAh9jOBVd2EVV3AUV3A458CAsR/bAxgT5UBI4H0CLSGHFLWnJB2yBEA2xPDzCSXNsmLHgNGjWs0oSSIIowEsmEDMHPN+UzIHT9QvTEMgIiBbTRu93g8Jovt4f4nfOtAzeaI8c/pMHmBnpnoxPvnMYuIHWUArv5S2ahUAAAAASUVORK5CYIIA]],
		code = 	function(x,y,c)
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
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAYklEQVQ4T2NkgIIuhln/YWxi6DKGNEaQOjBBqmaYBSBDGMnVDDME5AKSnI7uvUFowP///xkYGcFhiwGwyWF4YeANICYRIasZhLFAkRdAMUAMQI5mWIQTpxPTdJQUQ6ohYMsBkhQqKdE+UpEAAAAASUVORK5CYIIA]],
		code = 	function(x,y,c)
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
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA0ElEQVQ4T62TwQ3CMAxFf8ZouPfGDDAA7ABjwABdA3aAAWAGbr1TxjCyIyduQqUU1YfKrvOfnThxSEbGr3EdL5IPgLliLeAY8K9YINUAIoKTemMbAXhR6s1hcyE8j0HEue0VMY7r8i1YUXMitG0QMcCfEeNJgBWxz8aQxwEC0Fg7K87Aivo+7XfoEsBCJgGf14Bm7SMhB3Ae91U5Be5Ak9oNx3TzcQua/z3G3VvIbBamh2jFBSAfIwxM7sE+tG1t2YtUXLOKH4s8Jq0z91FJ8S+8E2wFQ2nZ2wAAAABJRU5ErkJgggAA]],
		code = 	function(x,y,c)
			SimulatePlatformerplayer(x,y,c,VertVal[math.random(1,2)],HoriVal[math.random(1,2)])
       		c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Weak Bob",
		desc = "Does Bob things, weaker",
		id = "weakbob",
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAXklEQVQ4T2NkQID/SGximIwgRWCCgYHh/9y5c4nRBFeTnJwM1g8ygGTNIJ1QA8AuQDEgKSmJYd68eVhdgy4HMmQQGkBKSGL1whA3ABRNxABYNA+jMKA4M8HCjazsDADqhk8F4AFgFwAAAABJRU5ErkJgggAA]],
		code = 	function(x,y,c)
			NudgeCell(x,y,math.random(0,3))
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Slide Bob",
		desc = "Does Bob things but sliding",
		id = "slidebob",
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAd0lEQVQ4T2NkgIKVYQz/YWxi6PBVDIwgdWACpNnViRO3PlZOBobf31Hkd+/7zgAyhJGgZjzOmbX2O9gFJDkd3TwMA/7//8/AyAj2GQbAJjcIDSAmCpHVUD8QB9YFoGgiBiBHM+VhQElSBuUH4jITFn/BMxOl2RkAnfY80YVbK9wAAAAASUVORK5CYIIA]],
		code = 	function(x,y,c)
			local bobdir = math.random(1,2)
			if c.rot == 0 or c.rot == 2 then
				local possibledir = {0,2}
				NudgeCell(x,y,possibledir[math.random(1,2)])
			else
				local possibledir = {1,3}
				NudgeCell(x,y,possibledir[math.random(1,2)])
			end
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Slide Weak Bob",
		desc = "Does Bob things but sliding and weaker",
		id = "slideweakbob",
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAe0lEQVQ4T2NkgIKVYQz/YWxi6PBVDIwgdWACpNnViRO3PlZOBobf31Hkd+/7zgAyhJGgZjzOmbX2O9gF/+fOnUuMqzHUJCcnYxqQlJTEMG/ePKwGossNUgNICQysXhjiBoCiiRgAi2bqhAElSRmUH4jLTFj8Bc9MlGZnAK0ZWtFGEGdkAAAAAElFTkSuQmCC]],
		code = 	function(x,y,c)
			local bobdir = math.random(1,2)
			if c.rot == 0 or c.rot == 2 then
				local possibledir = {0,2}
				PushCell(x,y,possibledir[math.random(1,2)],{force=1})
			else
				local possibledir = {1,3}
				PushCell(x,y,possibledir[math.random(1,2)],{force=1})
			end
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Puller Bob",
		desc = "Does Bob things but pulls",
		id = "pullerbob",
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAWElEQVQ4T2NkQID/SGximIwgRWCCgYHh/3+jB8RogqthPKcA1g8ygGTNMFNAhmAacFaegcH4IXbXoMkNVgNICErsXhjiBoCiiRgAjeZhFAYUZyZYsJGVnQG9VEgFua0HZgAAAABJRU5ErkJgggAA]],
		code = 	function(x,y,c)
			PullCell(x,y,math.random(0,3),{force=1})
			c.updated = true
				   end,
		subtick = 69
	},
	{
		name="Baloon Bob",
		desc = "Does Bob things but baloon",
		id = "baloonbob",
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAhUlEQVQ4T82TwQ2AMAhFP0O5gg7l2aF0BYfCgCElllpML3JoSMp/LZ9AKMEuz6QkRXoA4D0jcTXLnZMAQvH5AE7BAwKpADMzNuXWsTLjcHc/BdjHvQdR/1IXtuA7F0hL3AX0xK+AjDgEyAgzYaMMPci+3mxhCPBF7H8wvEzmW87B4rIuzAWfQDsFoPvmoAAAAABJRU5ErkJgggAA]],
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
		id = "gob",
		b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAXUlEQVQ4T2NkgILjl/P/w9jE0Ja6ExlB6sAESLOl7kRi9MHVHL+czwAyhJEczUiuZsAw4P///wyMjGCHYQB0OZArBqEBpIQkVi8McQNA0UQMgEXzcAkDijMTpdkZAAXEc3GLImFWAAAAAElFTkSuQmCC]],
		code = 	function(x,y,c)
					PushCell(x,y,math.random(0,3),{force=1})
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
					end
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
	BobCells[1].b64tex = [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAYElEQVQ4T82TwQoAIAhD5/9/tKEQWUas8JCHEJxPWyQYoSFnUjGRHwBum/sAMcBrs0MSQFUhzs2xq30IYOyPmnoTnzc4ub9Co3a6ghWYiM/8kQfM6jtNyWfqYM7BsYYPbyslKwW/sLNWAAAAAElFTkSuQmCC]]
	BobCells[1].name = "Happy Bob"
	BobCells[1].desc = "Bob is happy,its his birthday and he is now " .. currentDate.year - 2023 .. " Years old,and still,he will Do Bob things as usual,but this time,he'll do Bob things,but with a smile"
end

--makes cell real
for _, cell in ipairs(BobCells) do
	love.filesystem.write("textures/BobMod/" .. cell.id .. ".png", love.data.decode("string", "base64", cell.b64tex))
	NewTex("BobMod/" .. cell.id,cell.id)
	cellinfo[cell.id] = {name=cell.name,desc=cell.desc}
	AddSubtick(function()
		return RunOn(function(c) return not c.updated and c.id == cell.id end,
		function(x,y,c)
        	cell.code(x,y,c)
    	end,
		"rightup",
		cell.id)
		end,cell.subtick)
	table.insert(cat.pushers,cell.id)
end

--KEEP AT END
CreateCategories()
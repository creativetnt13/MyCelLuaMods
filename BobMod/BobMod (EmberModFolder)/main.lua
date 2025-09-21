--Remove the need of having to store the texture twice
function BOB_NewTex(val, id)
	local key = id or val
	UnloadTex(key)
	local t = {}
	tex[key] = t
	local f = function()
		local path = "Mods/BobMod/Files/textures/"
		if love.filesystem.getInfo(texpath..val..".png") then path = texpath end
		if not love.filesystem.getInfo(path..val..".png") then
			DEBUG(path..val..".png not found!")
			tex[key] = nil
			return
		end
		t.normal = love.graphics.newImage(path..val..".png")
		t.size = {w=t.normal:getWidth(),h=t.normal:getHeight(),w2=t.normal:getWidth()*.5,h2=t.normal:getHeight()*.5}
		t.path = val
	end
	if postloading then f()
	else table.insert(truequeue, f) end
end


if love.filesystem.read("secrets/b1") then --Juuuuust in case I forget to do taht in the instal code (oh and if someone manualy instals)
	love.filesystem.remove("secrets/b1")
	love.filesystem.remove("secrets/b2")
	love.filesystem.remove("secrets/b3")
	love.filesystem.remove("secrets/b4")
end

--Fixing a CelLua bug, oh and making it look into BobMod's secret folder

function HandleSecret(str)
	if str:len() == 0 then return end
	if postloading and GetSaved("secrets")[str] then return end
	local success
	local f = function()
		local dir = "secrets"
		local files = love.filesystem.getDirectoryItems(dir)
		for i=1,#files do
			local file = love.filesystem.read(dir .. "/" ..files[i])
			local decoded = DecryptWithKey(file,str)
			local loaded = pcall(loadstring(decoded))
			if loaded then
				if postloading then
					GetSaved("secrets")[str] = true
				end
				success = true
				lastselects = {} --Prevents secrets from breaking last selects or something
				break
			end
		end

		local dir = "Mods/BobMod/BobSecrets" --i tried an other way, but it didn't work
		local files = love.filesystem.getDirectoryItems(dir)
		for i=1,#files do
			local file = love.filesystem.read(dir .. "/" ..files[i])
			local decoded = DecryptWithKey(file,str)
			local loaded = pcall(loadstring(decoded))
			if loaded then
				if postloading then
					GetSaved("secrets")[str] = true
				end
				success = true
				break
			end
		end
	end
	if postloading then f()
	else table.insert(truequeue,f) end
	do return success end
end

require("Mods.BobMod.Files.Platfunc") --Has SimulatePlatformerplayer function

function CustomBob(x,y,c, dirs, type, vars)
	local dir = dirs[math.random(1,#dirs)]
	if type == "push" then
		PushCell(x,y,dir,{force=1})
	elseif type == "repulse" then
		x,y = StepForward(x,y,dir)
		PushCell(x,y,dir,{force=1,noupdate=true})
	elseif type == "pull" then
		PullCell(x,y,dir,{force=1})
	elseif type == "impulse" then
		x,y,dir = NextCell(x,y,dir,nil,true)
		local cx,cy = StepForward(x,y,dir)
		PullCell(cx,cy,(dir+2)%4,{force=1,noupdate=true})
	elseif type == "grab" then
		GrabCell(x,y,dir,{force=1})
	elseif type == "nudge" then
		NudgeCell(x,y,dir)
	elseif type == "drill" then
		local cx,cy = StepForward(x,y,dir)
		SwapCells(x,y,(dir+2)%4,cx,cy,dir)
	elseif type == "tunnel" then
		TunnelCell(x,y,dir)
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

table.insert(lists, 10, {name = "BobMod", cells = {max=99}, desc = "BobMod cells", icon = 'bob'})

Cats = {
	"Push Bob",
	"Pull Bob",
	"Grab Bob",
	"Nudge Bob",
	"Drill Bob",
	"Tunneller Bob",
	"Misc Bob"
}

--makes cell real,might need some rewrite
for _, Meow in ipairs(Cats) do
	cat[Meow] = {name=Meow,max=4}
	local curcat = cat[Meow]

	local cells = require("Mods.BobMod.Files.Cells." .. Meow)
	for _, cell in ipairs(cells) do
		BOB_NewTex(cell.text or cell.id, cell.id)
		cellinfo[cell.id] = {name=cell.name,desc=cell.desc}
		AddSubtick(function()
			return RunOn(function(c) return not c.updated and c.id == cell.id end,
			function(x,y,c)
				cell.code(x,y,c)
			end,
			"rightup",
			cell.id)
			end,cell.subtick)
		curcat[#curcat+1] = cell.id
	end
	table.insert(lists[10].cells, curcat)
end

local SecretBobIndex = #lists[10].cells + 1

function BOB_InjectToCat(cellid)
	if not lists[10].cells[SecretBobIndex] then
		cat.SecretBob = {name="Secret Bob Cells",max=4}
		table.insert(lists[10].cells, cat.SecretBob)
	end
	table.insert(lists[10].cells[SecretBobIndex], cellid)

	lastselects = {}
	CreateCategories()
end

lastselects = {}

table.insert(plevels, {symbol="▲",6,"K3:#aa00ffBOB FIGHT:Survive god's #ff0000wrath;p;k;1:eNqz8bSxGbLIAD8AAL+3NVA=;eNrtWItqwjAU/ZWOMZqxWpJqJ0j2YCBMhlMnDFwmUrWTgs5XGQ7ZP/kNftlSZ9vo+rKta5UFhTS5ae89ObknSRO3ex9DrYthcw+16UjpqB6NP1UwFgmCBI8U7V3H+F6SYT0vPyMIcZCX7M/9v6u9IjCrWQiUsNUDZmWmmZo9FbfM1hhu2NnDkeDUDI+p5k4FN1ACYuo+K/+8OzreBU4oQQxDE89nVvwyaVqSpLNjO7gbqv8wSfRbDqtVgoByQaQsySokh2xlpJJYp38naUwtF+LdK7A4KQUGmbwcAJmjETqTKQJlyrVKpEu28YY2ohaRJAue6QqTgaJPtBnG7WF78y3iegDcGmD237JfSaWIjcvxJypQvSIIj/qKbgBGJHYdyq7rMFJasOOppAiuEAsohjWXNhRChJkECrsm/5A4GFuUBl0eDXUqlLiu1uUm6mD4oXKazhXOcWKbP0+8YtlVxEKcRGFwjH0tDuChwYiAOcscP+d3OIsfPkTMAXAV/6rwXzx2hSpknveGCeh9giRDmLPM/YhxPWJrz6ERLVKaNh7nXpdFyZmBWccy0LZGt4J9JKVmXpGldDKceLmfc0B5K12e0HQhciJ2NTDyCU+TiY9Fxs+g5WGwciIj4ohe+vrgH0YkL32dSCSMwBwBSIjt1zsjCBFJNoQg56gF0C6m23ef3OkbLRC+FB8rrMWmsi0XywWrbDUHmLkM/gZ8yxhp;"})
CreateLevelMenu()
CreateCategories()

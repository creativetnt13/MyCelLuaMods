--Hello, the code here is a mess, so good luck snooping around ! (also, if you want to keep your sanity then do not try to copy 2.0 BobMod to make your own mod)

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

local oldHandleSecret = HandleSecret

function HandleSecret(str)
	return oldHandleSecret(str) or HandleBobSecrets(str)
end

function HandleBobSecrets(str)
	if str:len() == 0 then return end
	if postloading and GetSaved("secrets")[str] then return end
	local success
	local dir = "Mods/BobMod/BobSecrets"
	local f = function()
		local files = love.filesystem.getDirectoryItems(dir)
		for i=1,#files do
			local file = love.filesystem.read(dir .. "/"..files[i])
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

Secrets = {}

for k,v in pairs(GetSaved("secrets")) do
	HandleBobSecrets(k) -- Loads the bob secrets when loading the mod, it shouldn't be able to load them when BobMod is off
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

HoriVal = {0,2}
VertVal = {1,3}
--cells

table.insert(lists, 10, {name = "BobMod", cells = {max=99}, desc = "BobMod cells", icon = 'Bob'})

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
		if not cell.text then cell.text = string.lower(cell.id) end
		BOB_NewTex(cell.text, cell.id)
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

--I could do this when making the cell, but only Platformer Bob needs it, so ima just procrastinate
local oldefvars = DefaultVars
function DefaultVars(id, norng)
	if id == "Platbob" then return {2,0,0} end
    return oldefvars(id,norng)
end

local oldsetselcell = SetSelectedCell --Why didn't I do this before ???
function SetSelectedCell(id, b)
	oldsetselcell(id,b)
	if (id == "Platbob") and b then
		propertiesopen = 1
		MakePropertyMenu({{"Jump Strength: ",0,default=2}},b)
	end
end

MergeIntoInfo("placedvars",{
	["Platbob"]=1
})

MergeIntoInfo("afterdraw", {
	["Platbob"]=DrawSmallNumber
})

lastselects = {}

table.insert(plevels, {symbol="▲",6,"K3:#aa00ffBOB FIGHT:Survive god's #ff0000wrath;p;k;1:eNqz8bSxGbLIAD8AAL+3NVA=;eJztWItqwjAU/ZWOMZoxlaTaCZI9EITJcNYJA5eJVO2koPNVxCH7J7/BL1vq1MYutrVWm8GCQpqctPee3HtP0zpudiZ9s41h/Qi98UBvGR6DP10wTBEECR7o5oeF8YOiwmpWfUEQ4iA3OZ75p+u9ITCtbBgo4s0MmJaYYQp7LrhgKw63cM5ylOANC+DxkYOMQ97enO7eFUE8/4+7U0RRCGDowPPZFb9KKkqR5Bu2h7mh5uPvhQmi33KoaQQB/YooaZLWSQY5ykglsUr/PGkUNhYO4s6TJz3HMJNVAzATv5eRZhXQEjRSbg2iXLODd3QQNYiibOgZLznp6dbInGKc7ze375JaLYCuBev5e/Yp8fPAEbFhKfpCBbQbgrDW1a0mJYwobB6qO/PwoLLg+FMWiK4QCRRBzonGQgg342Bh3+Ifkgf7FaVG06NmjBNFqW22pZHR608MybSk3CWO7eXPk69I3ioiCZxYaeD6vhIH8FhjRGC9y5I8k/c4i/99ipgD4NL/ZZO/ZLyTqhD57k8TsLoEKbYwp5nvI/bnEUd7BGYxgkro4si+nHl9LIoPBqatDcB0rW4Ee4igMC/PBN0MXlwe5xxQcpXLM1ouUlIK7wTY9USmxcQHkfQDNDwASyOSHkYEs9LXBn83DrLS14hY3AgcIwAlIvt1LghCRFFtIchwtQA6bW12/lM6f6cNwtfCU5lFbCvbYr6Ys8pW4dAsJfE3FD4YKQ==;"})

BobCursor = love.mouse.newCursor(love.image.newImageData("Mods/BobMod/Files/textures/cursor.png"), 0, 0)

--Put it in a setting I guess
if settings.bobcur then
	love.mouse.setCursor(BobCursor)
end

BOB_NewTex("bobcurbtn", "bobcurbtn")

--To the creator of BenhideMain and BenhideMain++
--if the button is in the way, you can set BobButtonx and BobButtony to the button to an other spot 

local b = NewButton(BobButtonx or 125, BobButtony or 45, 20, 20, "bobcurbtn", "bobcurbtn", "Bob Cursor", nil, function(b)
	settings.bobcur = not settings.bobcur
	SetEnabledColors(b, settings.bobcur)
	love.mouse.setCursor(settings.bobcur and BobCursor or nil)
end, false, function() return mainmenu == "options" end, "center",2000,nil,{.5,.5,.5,1},{.75,.75,.75,1}, {.25,.25,.25,1})
SetEnabledColors(b, settings.bobcur)

CreateLevelMenu()
CreateCategories()
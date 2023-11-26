function SwapTableell(tbl, ell1, ell2)
    local oldell1 = tbl[ell1]
    local oldell2 = tbl[ell2]
    tbl[ell1] = oldell2
    tbl[ell2] = oldell1
end

function Getkeys(rngtable)
    local keys = {}
    for k, _ in pairs(rngtable) do
        table.insert(keys, k)
        print(k)
    end
    return keys
end

function Shuffle(var, intencity)
    if var == "bordercells" then
        bordercells = {}
        for _ = 1, 26 do
            table.insert(bordercells, math.random(1,1200))
        end
    elseif var == "math.halfpi" then
        math.halfpi = math.random(0,360)
    else
        if var == "cellinfo" then cellinfokey = Getkeys(cellinfo) end
        if var == "cat" then catkeys = Getkeys(cat) end
        if var == "tex" then texkeys = Getkeys(tex) end
        if var == "buttons" then buttonskeys = Getkeys(buttons) end

        for _ = 1, intencity do --Main loop
            if var == "lists" then
                SwapTableell(lists, math.random(0,#lists), math.random(0,11))
            elseif var == "subticks" then
                SwapTableell(subticks, math.random(1, #subticks), math.random(1, #subticks))
            elseif var == "difficulties" then
                SwapTableell(difficulties, math.random(1, #difficulties), math.random(1, #difficulties))
            elseif var == "levels" then
                SwapTableell(levels, math.random(1, #levels), math.random(1, #levels))
            elseif var == "plevel" then
                SwapTableell(plevels, math.random(1, #plevels), math.random(1, #plevels))
            elseif var == "cellinfo" then
                SwapTableell(cellinfo, cellinfokey[math.random(1, #cellinfokey)], cellinfokey[math.random(1, #cellinfokey)])
            elseif var == "cat" then
                SwapTableell(cat, catkeys[math.random(1, #catkeys)], catkeys[math.random(1, #catkeys)])
            elseif var == "tex" then
                SwapTableell(tex, texkeys[math.random(1, #texkeys)], texkeys[math.random(1, #texkeys)])
            elseif var == "buttons" then
                SwapTableell(buttons, buttonskeys[math.random(1, #buttonskeys)], buttonskeys[math.random(1, #buttonskeys)])
            end
        end
    end
    CreateCategories()
end

randomisablethings = {
    "bordercells",
    "math.halfpi",
    "cellinfo",
    "cat",
    "tex",
    "lists",
    "subticks",
    "difficulties",
    "levels",
    "plevel",
    "buttons",
}

Intencitytable = {
    5,
    10,
    25,
    50,
    75,
    100,
    250,
    500,
    1000,
    2500,
    5000,
}

while not Done do
    Done = false
    local result1 = love.window.showMessageBox("CelLua randomiser", "Welcome to CelLua randomiser !\n To randomise cellua,you'll have to select what you randomise !", randomisablethings, "info")
    local result2 = love.window.showMessageBox("CelLua randomiser", "Pick an intencity of it (bigger the number,the more randomised it is)\nNote: it wont work on: math.halfpi and bordercells", Intencitytable, "info")
    Shuffle(randomisablethings[result1], Intencitytable[result2])
    table.remove(randomisablethings, result1)
    result = love.window.showMessageBox("CelLua randomiser", "Are you done randomising things ?", {"Yes", "No"}, "info")
    if result == 1 or #randomisablethings == 0 then
        Done = true
    end
end
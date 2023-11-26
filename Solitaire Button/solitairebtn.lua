NewTex("trashed/kyyay", "kyyay")
local b = NewButton(175,50,20,20,"kyyay","kyyay","Enable Solitaire",nil,function(b) settings.solitaire = not settings.solitaire persistentcanv = not persistentcanv; SetEnabledColors(b,settings.solitaire,true) end,false,function() return inmenu and not winscreen and not mainmenu or mainmenu == "options" end,"center",2000,nil,{.5,.5,.5,1},{.75,.75,.75,1},{.25,.25,.25,1})
SetEnabledColors(b,settings.solitaire,true)

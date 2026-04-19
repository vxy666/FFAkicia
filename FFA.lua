local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

local Window = Library:CreateWindow({
    Title = 'vxy ultimate ffa script',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local MainTab = Window:AddTab('Main')

-- Left Side: Primary Loader
local LeftGroupBox = MainTab:AddLeftGroupbox('Primary Loader')

LeftGroupBox:AddButton({
    Text = 'Inject Kicia Hook',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.luau"))()
        Library:Notify('Kicia Hook injected!', 3)
    end
})

-- Right Side: Utility Modules
local RightGroupBox = MainTab:AddRightGroupbox('Modules')

RightGroupBox:AddButton({
    Text = 'FFA Auto Collect',
    Func = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-FFA-Auto-Collect-Boosters-139784"))()
        Library:Notify('FFA Auto Collect injected!', 3)
    end
})

RightGroupBox:AddButton({
    Text = 'Anti-AFK',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicht-Reden/Ultimate-FFa-HUB-Rivals-/refs/heads/main/Anti%20AFK"))()
        Library:Notify('Anti-AFK injected!', 3)
    end
})

RightGroupBox:AddButton({
    Text = 'Staff Detector',
    Func = function()
        shared.StaffDetectorLoading = false
        autoload = false
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Ukrubojvo/Modules/main/StaffDetector.lua"))()
        Library:Notify('Staff Detector injected!', 3)
    end
})

RightGroupBox:AddButton({
    Text = 'FPS Boost',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pouloupatisfilipp-rgb/ffa_fpsboost_/main/fpsboost"))()
        Library:Notify('FPS Boost injected!', 3)
    end
})

-- Management Section
local SettingsGroupBox = MainTab:AddLeftGroupbox('Settings')

SettingsGroupBox:AddButton('Unload Menu', function() 
    Library:Unload() 
end)

SettingsGroupBox:AddLabel('Toggle Key'):AddKeyPicker('MenuKeybind', { 
    Default = 'RightControl', 
    NoUI = true, 
    Text = 'Menu keybind' 
})

Library:Notify('vxy ultimate ffa script loaded | Press Right Control', 5)

print("[vxy debug] Script started. Initializing Library...")

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local LibrarySuccess, Library = pcall(function()
    return loadstring(game:HttpGet(repo .. 'Library.lua'))()
end)

if not LibrarySuccess or not Library then
    warn("[vxy error] Failed to load LinoriaLib. Check your internet or the URL.")
    return
end

print("[vxy debug] Library loaded. Creating Window...")

local Window = Library:CreateWindow({
    Title = 'vxy ultimate ffa script',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

print("[vxy debug] Window created. Adding Tabs...")

local Tabs = {
    Main = Window:AddTab('Main'),
}

-- Left Side: Primary Loader
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Primary Loader')

print("[vxy debug] Initializing Buttons...")

LeftGroupBox:AddButton({
    Text = 'Inject Kicia Hook',
    Func = function()
        print("[vxy debug] Injected Kicia Hook button pressed.")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.luau"))()
        end)
        if success then 
            Library:Notify('Kicia Hook injected!', 3) 
        else 
            warn("[vxy error] Kicia Hook failed: " .. tostring(err))
        end
    end
})

-- Right Side: Utility Modules
local RightGroupBox = Tabs.Main:AddRightGroupbox('Modules')

local function SafeLoad(name, url)
    print("[vxy debug] Attempting to load module: " .. name)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if success then
        Library:Notify(name .. ' injected!', 3)
    else
        warn("[vxy error] " .. name .. " failed: " .. tostring(err))
        Library:Notify('Failed to load ' .. name, 3)
    end
end

RightGroupBox:AddButton({ Text = 'FFA Auto Collect', Func = function() SafeLoad('FFA Auto Collect', "https://rawscripts.net/raw/RIVALS-FFA-Auto-Collect-Boosters-139784") end })
RightGroupBox:AddButton({ Text = 'Anti-AFK', Func = function() SafeLoad('Anti-AFK', "https://raw.githubusercontent.com/Nicht-Reden/Ultimate-FFa-HUB-Rivals-/refs/heads/main/Anti%20AFK") end })
RightGroupBox:AddButton({ Text = 'FPS Boost', Func = function() SafeLoad('FPS Boost', "https://raw.githubusercontent.com/pouloupatisfilipp-rgb/ffa_fpsboost_/main/fpsboost") end })

-- Management Section
local SettingsGroupBox = Tabs.Main:AddLeftGroupbox('Settings')

SettingsGroupBox:AddButton('Unload Menu', function() 
    print("[vxy debug] Unloading UI...")
    Library:Unload() 
end)

SettingsGroupBox:AddLabel('Toggle Key'):AddKeyPicker('MenuKeybind', { 
    Default = 'RightControl', 
    NoUI = true, 
    Text = 'Menu keybind' 
})

-- Finalizing
print("[vxy debug] Linking ToggleKeybind...")
Library.ToggleKeybind = Options.MenuKeybind 

print("[vxy debug] Script fully loaded! Use RightControl to toggle.")
Library:Notify('vxy ultimate ffa script loaded | Press Right Control', 5)

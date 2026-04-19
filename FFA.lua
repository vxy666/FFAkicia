local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinBtn = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local WarningLabel = Instance.new("TextLabel")
local UIStroke = Instance.new("UIStroke")
local UnloadTab = Instance.new("TextButton")

-- Logic Variables
local minimized = false

-- Root Setup
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "vxy_ffa_main"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
MainFrame.Size = UDim2.new(0, 350, 0, 350) -- Increased height for warning
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(60, 60, 60)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Top Bar
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

Title.Parent = TopBar
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "vxy ffa"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextSize = 16

MinBtn.Parent = TopBar
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -35, 0, 0)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 18
MinBtn.Font = Enum.Font.Code

UnloadTab.Parent = TopBar
UnloadTab.Size = UDim2.new(0, 35, 0, 35)
UnloadTab.Position = UDim2.new(1, -70, 0, 0)
UnloadTab.BackgroundTransparency = 1
UnloadTab.Text = "X"
UnloadTab.TextColor3 = Color3.fromRGB(255, 50, 50)
UnloadTab.TextSize = 16
UnloadTab.Font = Enum.Font.Code

-- Content Container
ContentFrame.Size = UDim2.new(1, -20, 1, -85)
ContentFrame.Position = UDim2.new(0, 10, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.ScrollBarThickness = 2
ScrollFrame.Parent = ContentFrame

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- IMPORTANT ALERT LABEL
WarningLabel.Size = UDim2.new(1, 0, 0, 40)
WarningLabel.Position = UDim2.new(0, 0, 1, -40)
WarningLabel.Parent = MainFrame
WarningLabel.BackgroundColor3 = Color3.fromRGB(25, 10, 10)
WarningLabel.Text = "!! DO NOT EXECUTE OTHER SCRIPTS !!\nUNTIL KICIA HAS LOADED"
WarningLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
WarningLabel.Font = Enum.Font.Code
WarningLabel.TextSize = 12
WarningLabel.BorderSizePixel = 0

local WarnCorner = Instance.new("UICorner")
WarnCorner.CornerRadius = UDim.new(0, 4)
WarnCorner.Parent = WarningLabel

UnloadTab.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local function createButton(name, url, isStaff)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 40)
    btn.Font = Enum.Font.Code
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = "EXECUTE: " .. name:upper()
    btn.Parent = ScrollFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        btn.Text = "RUNNING..."
        if isStaff then
            _G.StaffDetectorLoading = false
            loadstring(game:HttpGetAsync(url))()
        else
            loadstring(game:HttpGet(url))()
        end
        task.wait(1)
        btn.Text = name:upper() .. " READY"
    end)
end

-- Setup Buttons (All unlocked)
createButton("Kicia Hook", "https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.luau")
createButton("Auto Collect", "https://rawscripts.net/raw/RIVALS-FFA-Auto-Collect-Boosters-139784")
createButton("Anti-AFK", "https://raw.githubusercontent.com/Nicht-Reden/Ultimate-FFa-HUB-Rivals-/refs/heads/main/Anti%20AFK")
createButton("Staff Detector", "https://raw.githubusercontent.com/Ukrubojvo/Modules/main/StaffDetector.lua", true)
createButton("FPS Boost", "https://raw.githubusercontent.com/pouloupatisfilipp-rgb/ffa_fpsboost_/main/fpsboost")

-- Standard Toggle
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainFrame:TweenSize(minimized and UDim2.new(0, 350, 0, 35) or UDim2.new(0, 350, 0, 350), "Out", "Quad", 0.2, true)
    MinBtn.Text = minimized and "+" or "_"
    WarningLabel.Visible = not minimized
end)

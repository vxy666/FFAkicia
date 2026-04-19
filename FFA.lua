local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinBtn = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local StatusLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local UIStroke = Instance.new("UIStroke")

-- Tab System for Unload
local UnloadTab = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

-- Logic Variables
local minimized = false
local kiciaExecuted = false
local secondaryButtons = {}

-- Root Setup
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "vxys_ffa_cyber"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
MainFrame.Position = UDim2.new(0.5, -135, 0.5, -110)
MainFrame.Size = UDim2.new(0, 270, 0, 220)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

-- Neon Glow Border
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
}
UIGradient.Rotation = 45
UIGradient.Parent = UIStroke

-- Top Bar
TopBar.Size = UDim2.new(1, 0, 0, 28)
TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

Title.Parent = TopBar
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Text = "vxy's ffa // CYBERNETICS"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextSize = 13

MinBtn.Parent = TopBar
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -28, 0, 0)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinBtn.TextSize = 18
MinBtn.Font = Enum.Font.Code

UnloadTab.Parent = TopBar
UnloadTab.Size = UDim2.new(0, 28, 0, 28)
UnloadTab.Position = UDim2.new(1, -56, 0, 0)
UnloadTab.BackgroundTransparency = 1
UnloadTab.Text = "X"
UnloadTab.TextColor3 = Color3.fromRGB(150, 0, 0)
UnloadTab.TextSize = 16
UnloadTab.Font = Enum.Font.GothamBold

-- Content
ContentFrame.Size = UDim2.new(1, -10, 1, -38)
ContentFrame.Position = UDim2.new(0, 5, 0, 33)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.CanvasSize = UDim2.new(0, 0, 1.8, 0)
ScrollFrame.ScrollBarThickness = 1
ScrollFrame.Parent = ContentFrame

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 12)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Text = "// SYSTEM IDLE :: AWAITING CORE"
StatusLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextSize = 10
StatusLabel.BackgroundTransparency = 1
StatusLabel.Parent = ScrollFrame

-- Unload UI Logic
UnloadTab.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Button Creation (Fancy AF)
local function createCyberButton(name, titleText, url, isPrimary, isStaff)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.95, 0, 0, 45)
    container.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    container.BorderSizePixel = 0
    container.Parent = ScrollFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Parent = container
    stroke.Thickness = 1
    stroke.Color = Color3.fromRGB(30, 30, 35)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = container
    titleLabel.Size = UDim2.new(1, -10, 0, 15)
    titleLabel.Position = UDim2.new(0, 5, 0, 4)
    titleLabel.Text = titleText:upper()
    titleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.Code
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextSize = 10

    local btn = Instance.new("TextButton")
    btn.Parent = container
    btn.Size = UDim2.new(1, -10, 0, 22)
    btn.Position = UDim2.new(0, 5, 0, 19)
    btn.Font = Enum.Font.Code
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 3)
    btnCorner.Parent = btn

    if not isPrimary then
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
        btn.TextColor3 = Color3.fromRGB(60, 60, 65)
        btn.Text = "[ LOCKED ]"
        table.insert(secondaryButtons, {button = btn, originalName = "[ EXECUTE: "..name:upper().." ]", link = url, staff = isStaff, containerStroke = stroke})
    else
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = "[ EXECUTE: "..name:upper().." ]"
        
        btn.MouseButton1Click:Connect(function()
            if kiciaExecuted then return end
            kiciaExecuted = true
            btn.Text = "LOADING CORE..."
            loadstring(game:HttpGet(url))()
            
            task.spawn(function()
                for i = 5, 1, -1 do
                    StatusLabel.Text = "// DECRYPTING DEPENDENCIES :: " .. i .. "s"
                    task.wait(1)
                end
                StatusLabel.Text = "// SYSTEM ACTIVE // NETWORK ESTABLISHED"
                StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
                btn.Text = "[ "..name:upper().." :: ACTIVE ]"
                btn.TextColor3 = Color3.fromRGB(0, 255, 150)
                
                -- Global Flex Unlock Animation
                UIStroke.Color = Color3.fromRGB(0, 255, 255) -- Main border glow
                
                -- Unlock others
                for _, data in pairs(secondaryButtons) do
                    data.button.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                    data.button.TextColor3 = Color3.fromRGB(200, 200, 200)
                    data.button.Text = data.originalName
                    data.containerStroke.Color = Color3.fromRGB(50, 50, 60)
                    
                    data.button.MouseButton1Click:Connect(function()
                        data.button.Text = "INJECTING..."
                        if data.staff then
                            shared.StaffDetectorLoading = false
                            autoload = false
                            loadstring(game:HttpGetAsync(data.link))()
                        else
                            loadstring(game:HttpGet(data.link))()
                        end
                        data.button.Text = "[ "..data.originalName:match(": (.*)%s%]"):upper().." :: ONLINE ]"
                        data.button.TextColor3 = Color3.fromRGB(0, 255, 150)
                        data.containerStroke.Color = Color3.fromRGB(0, 150, 100)
                    end)
                end
            end)
        end)
    end
end

-- POPULATE MODULES WITH TITLES
createCyberButton("Kicia Hook", "kicia", "https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.luau", true)
createCyberButton("Auto Collect", "FFA Booster Automation", "https://rawscripts.net/raw/RIVALS-FFA-Auto-Collect-Boosters-139784", false)
createCyberButton("Anti-AFK", "Anti Afk", "https://raw.githubusercontent.com/Nicht-Reden/Ultimate-FFa-HUB-Rivals-/refs/heads/main/Anti%20AFK", false)
createCyberButton("Staff Detector", "staff detector", "https://raw.githubusercontent.com/Ukrubojvo/Modules/main/StaffDetector.lua", false, true)
createCyberButton("FPS Boost", "Graphics & Performance Optimizer", "https://raw.githubusercontent.com/pouloupatisfilipp-rgb/ffa_fpsboost_/main/fpsboost", false)

-- Standard Toggle Logic
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainFrame:TweenSize(minimized and UDim2.new(0, 270, 0, 28) or UDim2.new(0, 270, 0, 220), "Out", "Quad", 0.2, true)
    MinBtn.Text = minimized and "+" or "_"
end)

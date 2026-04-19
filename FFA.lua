local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinBtn = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local StatusLabel = Instance.new("TextLabel")
local UIStroke = Instance.new("UIStroke")
local UnloadTab = Instance.new("TextButton")

-- Logic Variables
local minimized = false
local kiciaExecuted = false
local secondaryButtons = {}

-- Root Setup (Larger GUI)
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "vxy_ffa_main"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
MainFrame.Size = UDim2.new(0, 350, 0, 320)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(40, 40, 40)
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
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
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

StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Text = "status: awaiting core"
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextSize = 12
StatusLabel.BackgroundTransparency = 1
StatusLabel.Parent = ScrollFrame

UnloadTab.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local function createButton(name, url, isPrimary, isStaff)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 40)
    btn.Font = Enum.Font.Code
    btn.TextSize = 14
    btn.Parent = ScrollFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn

    if not isPrimary then
        -- Initial Locked State
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        btn.TextColor3 = Color3.fromRGB(80, 80, 80)
        btn.Text = "LOCKED"
        table.insert(secondaryButtons, {button = btn, label = name, link = url, staff = isStaff})
    else
        -- Primary Button
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = "EXECUTE: " .. name:upper()
        
        btn.MouseButton1Click:Connect(function()
            if kiciaExecuted then return end
            kiciaExecuted = true
            
            btn.Text = "EXECUTING..."
            StatusLabel.Text = "status: loading script..."
            loadstring(game:HttpGet(url))()
            
            -- THE UNLOCK LOGIC
            task.delay(3, function()
                StatusLabel.Text = "status: active"
                StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
                btn.Text = name:upper() .. " ACTIVE"
                UIStroke.Color = Color3.fromRGB(0, 255, 100)
                
                for _, data in pairs(secondaryButtons) do
                    data.button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    data.button.TextColor3 = Color3.fromRGB(255, 255, 255)
                    data.button.Text = "EXECUTE: " .. data.label:upper()
                    
                    data.button.MouseButton1Click:Connect(function()
                        data.button.Text = "RUNNING..."
                        if data.staff then
                            _G.StaffDetectorLoading = false
                            loadstring(game:HttpGetAsync(data.link))()
                        else
                            loadstring(game:HttpGet(data.link))()
                        end
                        data.button.Text = data.label:upper() .. " READY"
                    end)
                end
            end)
        end)
    end
end

-- Setup Buttons
createButton("Kicia Hook", "https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.luau", true)
createButton("Auto Collect", "https://rawscripts.net/raw/RIVALS-FFA-Auto-Collect-Boosters-139784", false)
createButton("Anti-AFK", "https://raw.githubusercontent.com/Nicht-Reden/Ultimate-FFa-HUB-Rivals-/refs/heads/main/Anti%20AFK", false)
createButton("Staff Detector", "https://raw.githubusercontent.com/Ukrubojvo/Modules/main/StaffDetector.lua", false, true)
createButton("FPS Boost", "https://raw.githubusercontent.com/pouloupatisfilipp-rgb/ffa_fpsboost_/main/fpsboost", false)

-- Standard Toggle
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainFrame:TweenSize(minimized and UDim2.new(0, 350, 0, 35) or UDim2.new(0, 350, 0, 320), "Out", "Quad", 0.2, true)
    MinBtn.Text = minimized and "+" or "_"
end)

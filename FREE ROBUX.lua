--[[
    💀 FAKE ERROR PRANK SCRIPT
    Buat iseng temen!
]]

local Players       = game:GetService("Players")
local TweenService  = game:GetService("TweenService")
local LocalPlayer   = Players.LocalPlayer

local function New(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        pcall(function() obj[k] = v end)
    end
    if parent then obj.Parent = parent end
    return obj
end

local function Corner(p, r)
    return New("UICorner", {CornerRadius = UDim.new(0, r or 8)}, p)
end

local function Tween(obj, props, t)
    pcall(function()
        TweenService:Create(obj, TweenInfo.new(t or 0.3, Enum.EasingStyle.Quart), props):Play()
    end)
end

-- ═══════════════════════════
--      FAKE ERROR SCREEN
-- ═══════════════════════════
local GUI = New("ScreenGui", {
    Name = "FakeError",
    ResetOnSpawn = false,
    DisplayOrder = 9999,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, game.CoreGui)

-- Dark overlay
local Overlay = New("Frame", {
    Size = UDim2.new(1,0,1,0),
    BackgroundColor3 = Color3.fromRGB(0,0,0),
    BackgroundTransparency = 0.4,
    BorderSizePixel = 0,
}, GUI)

-- Error window
local Win = New("Frame", {
    Size = UDim2.new(0,480,0,0),
    Position = UDim2.new(0.5,-240,0.5,-180),
    BackgroundColor3 = Color3.fromRGB(12,12,12),
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
}, GUI)
Corner(Win, 10)

-- Red title bar
local TitleBar = New("Frame", {
    Size = UDim2.new(1,0,0,36),
    BackgroundColor3 = Color3.fromRGB(180,20,20),
    BorderSizePixel = 0,
}, Win)
Corner(TitleBar, 10)
New("Frame", {
    Size = UDim2.new(1,0,0.5,0),
    Position = UDim2.new(0,0,0.5,0),
    BackgroundColor3 = Color3.fromRGB(180,20,20),
    BorderSizePixel = 0,
}, TitleBar)

New("TextLabel", {
    Size = UDim2.new(1,-40,1,0),
    Position = UDim2.new(0,12,0,0),
    BackgroundTransparency = 1,
    Text = "⚠️  Roblox Critical Error",
    TextColor3 = Color3.fromRGB(255,255,255),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextSize = 13,
    Font = Enum.Font.GothamBold,
}, TitleBar)

-- Content area
local Content = New("Frame", {
    Size = UDim2.new(1,0,1,-36),
    Position = UDim2.new(0,0,0,36),
    BackgroundColor3 = Color3.fromRGB(15,15,15),
    BorderSizePixel = 0,
}, Win)
Corner(Content, 10)
New("Frame", {
    Size = UDim2.new(1,0,0.3,0),
    BackgroundColor3 = Color3.fromRGB(15,15,15),
    BorderSizePixel = 0,
}, Content)

-- Error icon
New("TextLabel", {
    Size = UDim2.new(0,60,0,60),
    Position = UDim2.new(0,20,0,20),
    BackgroundTransparency = 1,
    Text = "❌",
    TextSize = 48,
}, Content)

-- Error title
New("TextLabel", {
    Size = UDim2.new(1,-100,0,30),
    Position = UDim2.new(0,90,0,20),
    BackgroundTransparency = 1,
    Text = "FATAL_ERROR_EXCEPTION",
    TextColor3 = Color3.fromRGB(255,80,80),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextSize = 16,
    Font = Enum.Font.GothamBold,
}, Content)

-- Error code
New("TextLabel", {
    Size = UDim2.new(1,-100,0,20),
    Position = UDim2.new(0,90,0,52),
    BackgroundTransparency = 1,
    Text = "Error Code: 0x0000DEAD • ID: "..math.random(100000,999999),
    TextColor3 = Color3.fromRGB(150,150,150),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextSize = 11,
    Font = Enum.Font.Gotham,
}, Content)

-- Divider
New("Frame", {
    Size = UDim2.new(1,-40,0,1),
    Position = UDim2.new(0,20,0,90),
    BackgroundColor3 = Color3.fromRGB(50,50,50),
    BorderSizePixel = 0,
}, Content)

-- Error message
New("TextLabel", {
    Size = UDim2.new(1,-40,0,80),
    Position = UDim2.new(0,20,0,105),
    BackgroundTransparency = 1,
    Text = "Roblox has detected unauthorized memory access in your client.\n\nYour account has been flagged for suspicious activity. Account data may be corrupted. Please contact Roblox support immediately.\n\nProcess: RobloxPlayerBeta.exe has stopped working.",
    TextColor3 = Color3.fromRGB(200,200,200),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextWrapped = true,
    TextSize = 11,
    Font = Enum.Font.Gotham,
}, Content)

-- Fake progress bar
local ProgBG = New("Frame", {
    Size = UDim2.new(1,-40,0,8),
    Position = UDim2.new(0,20,0,195),
    BackgroundColor3 = Color3.fromRGB(40,40,40),
    BorderSizePixel = 0,
}, Content)
Corner(ProgBG, 4)

local ProgFill = New("Frame", {
    Size = UDim2.new(0,0,1,0),
    BackgroundColor3 = Color3.fromRGB(180,20,20),
    BorderSizePixel = 0,
}, ProgBG)
Corner(ProgFill, 4)

New("TextLabel", {
    Size = UDim2.new(1,-40,0,16),
    Position = UDim2.new(0,20,0,207),
    BackgroundTransparency = 1,
    Text = "Collecting error data...",
    TextColor3 = Color3.fromRGB(120,120,120),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextSize = 10,
    Font = Enum.Font.Gotham,
}, Content)

-- Buttons
local OkBtn = New("TextButton", {
    Size = UDim2.new(0,100,0,32),
    Position = UDim2.new(1,-230,0,235),
    BackgroundColor3 = Color3.fromRGB(180,20,20),
    Text = "Send Report",
    TextColor3 = Color3.fromRGB(255,255,255),
    TextSize = 12,
    Font = Enum.Font.GothamBold,
    BorderSizePixel = 0,
}, Content)
Corner(OkBtn, 6)

local CancelBtn = New("TextButton", {
    Size = UDim2.new(0,100,0,32),
    Position = UDim2.new(1,-120,0,235),
    BackgroundColor3 = Color3.fromRGB(40,40,40),
    Text = "Close",
    TextColor3 = Color3.fromRGB(200,200,200),
    TextSize = 12,
    Font = Enum.Font.GothamBold,
    BorderSizePixel = 0,
}, Content)
Corner(CancelBtn, 6)

-- ═══════════════════════════
--     SECOND ERROR POPUP
-- ═══════════════════════════
local Win2 = New("Frame", {
    Size = UDim2.new(0,360,0,0),
    Position = UDim2.new(0.5,60,0.5,-80),
    BackgroundColor3 = Color3.fromRGB(12,12,12),
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    Visible = false,
}, GUI)
Corner(Win2, 8)

local TB2 = New("Frame", {
    Size = UDim2.new(1,0,0,32),
    BackgroundColor3 = Color3.fromRGB(200,120,0),
    BorderSizePixel = 0,
}, Win2)
Corner(TB2, 8)
New("Frame", {Size=UDim2.new(1,0,0.5,0), Position=UDim2.new(0,0,0.5,0), BackgroundColor3=Color3.fromRGB(200,120,0), BorderSizePixel=0}, TB2)
New("TextLabel", {
    Size=UDim2.new(1,-10,1,0), Position=UDim2.new(0,10,0,0),
    BackgroundTransparency=1, Text="⚠️  Account Warning",
    TextColor3=Color3.fromRGB(255,255,255),
    TextXAlignment=Enum.TextXAlignment.Left,
    TextSize=12, Font=Enum.Font.GothamBold,
}, TB2)

local C2 = New("Frame", {
    Size=UDim2.new(1,0,1,-32), Position=UDim2.new(0,0,0,32),
    BackgroundColor3=Color3.fromRGB(18,18,18), BorderSizePixel=0,
}, Win2)
Corner(C2, 8)
New("Frame", {Size=UDim2.new(1,0,0.3,0), BackgroundColor3=Color3.fromRGB(18,18,18), BorderSizePixel=0}, C2)

New("TextLabel", {
    Size=UDim2.new(1,-20,0,80), Position=UDim2.new(0,10,0,10),
    BackgroundTransparency=1,
    Text="⚠️  Your account "..LocalPlayer.Name.." has been detected using unauthorized scripts.\n\nThis is your FINAL WARNING before permanent ban.\n\nAccount suspension: PENDING",
    TextColor3=Color3.fromRGB(255,200,100),
    TextXAlignment=Enum.TextXAlignment.Left,
    TextWrapped=true, TextSize=11, Font=Enum.Font.Gotham,
}, C2)

local OkBtn2 = New("TextButton", {
    Size=UDim2.new(0,90,0,28), Position=UDim2.new(0.5,-45,0,100),
    BackgroundColor3=Color3.fromRGB(200,120,0),
    Text="I Understand",
    TextColor3=Color3.fromRGB(255,255,255),
    TextSize=11, Font=Enum.Font.GothamBold, BorderSizePixel=0,
}, C2)
Corner(OkBtn2, 6)

-- ═══════════════════════════
--     THIRD ERROR - BAN
-- ═══════════════════════════
local Win3 = New("Frame", {
    Size=UDim2.new(0,400,0,0),
    Position=UDim2.new(0.5,-260,0.5,20),
    BackgroundColor3=Color3.fromRGB(8,8,8),
    BorderSizePixel=0, BackgroundTransparency=1, Visible=false,
}, GUI)
Corner(Win3, 10)

local TB3 = New("Frame", {
    Size=UDim2.new(1,0,0,36), BackgroundColor3=Color3.fromRGB(10,10,10),
    BorderSizePixel=0,
}, Win3)
Corner(TB3, 10)
New("Frame", {Size=UDim2.new(1,0,0.5,0),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=Color3.fromRGB(10,10,10),BorderSizePixel=0},TB3)
New("TextLabel", {
    Size=UDim2.new(1,-10,1,0), Position=UDim2.new(0,10,0,0),
    BackgroundTransparency=1, Text="🚨  ROBLOX MODERATION",
    TextColor3=Color3.fromRGB(255,50,50),
    TextXAlignment=Enum.TextXAlignment.Left,
    TextSize=13, Font=Enum.Font.GothamBold,
}, TB3)

local C3=New("Frame",{Size=UDim2.new(1,0,1,-36),Position=UDim2.new(0,0,0,36),BackgroundColor3=Color3.fromRGB(12,12,12),BorderSizePixel=0},Win3)
Corner(C3,10)
New("Frame",{Size=UDim2.new(1,0,0.3,0),BackgroundColor3=Color3.fromRGB(12,12,12),BorderSizePixel=0},C3)

New("TextLabel",{
    Size=UDim2.new(0,60,0,60),Position=UDim2.new(0,20,0,15),
    BackgroundTransparency=1,Text="🔨",TextSize=48,
},C3)

New("TextLabel",{
    Size=UDim2.new(1,-100,0,25),Position=UDim2.new(0,90,0,15),
    BackgroundTransparency=1,Text="Account Suspended",
    TextColor3=Color3.fromRGB(255,80,80),
    TextXAlignment=Enum.TextXAlignment.Left,
    TextSize=16,Font=Enum.Font.GothamBold,
},C3)

New("TextLabel",{
    Size=UDim2.new(1,-100,0,55),Position=UDim2.new(0,90,0,42),
    BackgroundTransparency=1,
    Text="Username: "..LocalPlayer.Name.."\nReason: Exploiting\nDuration: PERMANENT\nCase ID: #"..math.random(1000000,9999999),
    TextColor3=Color3.fromRGB(200,200,200),
    TextXAlignment=Enum.TextXAlignment.Left,
    TextWrapped=true,TextSize=11,Font=Enum.Font.Gotham,
},C3)

New("Frame",{Size=UDim2.new(1,-40,0,1),Position=UDim2.new(0,20,0,105),BackgroundColor3=Color3.fromRGB(40,40,40),BorderSizePixel=0},C3)

New("TextLabel",{
    Size=UDim2.new(1,-40,0,30),Position=UDim2.new(0,20,0,115),
    BackgroundTransparency=1,
    Text="You have been permanently banned from Roblox for violating\nour Terms of Service. This action cannot be appealed.",
    TextColor3=Color3.fromRGB(150,150,150),
    TextXAlignment=Enum.TextXAlignment.Left,
    TextWrapped=true,TextSize=10,Font=Enum.Font.Gotham,
},C3)

local AppealBtn=New("TextButton",{
    Size=UDim2.new(0,100,0,30),Position=UDim2.new(1,-220,0,155),
    BackgroundColor3=Color3.fromRGB(255,50,50),
    Text="Appeal Ban",TextColor3=Color3.fromRGB(255,255,255),
    TextSize=11,Font=Enum.Font.GothamBold,BorderSizePixel=0,
},C3)
Corner(AppealBtn,6)

local OkBtn3=New("TextButton",{
    Size=UDim2.new(0,100,0,30),Position=UDim2.new(1,-110,0,155),
    BackgroundColor3=Color3.fromRGB(40,40,40),
    Text="OK",TextColor3=Color3.fromRGB(200,200,200),
    TextSize=11,Font=Enum.Font.GothamBold,BorderSizePixel=0,
},C3)
Corner(OkBtn3,6)

-- ═══════════════════════════
--        ANIMATIONS
-- ═══════════════════════════
task.spawn(function()
    -- Animate Win open
    task.wait(0.5)
    Win.BackgroundTransparency = 0
    Tween(Win, {Size=UDim2.new(0,480,0,280)}, 0.4)
    task.wait(0.4)

    -- Animate progress bar
    for i = 0, 100, 2 do
        ProgFill.Size = UDim2.new(i/100, 0, 1, 0)
        task.wait(0.04)
    end

    -- Shake screen
    task.spawn(function()
        for i = 1, 8 do
            Win.Position = UDim2.new(0.5, -240 + math.random(-6,6), 0.5, -140 + math.random(-4,4))
            task.wait(0.05)
        end
        Win.Position = UDim2.new(0.5,-240,0.5,-140)
    end)

    task.wait(0.5)

    -- Show Win2
    Win2.Visible = true
    Win2.BackgroundTransparency = 0
    Tween(Win2, {Size=UDim2.new(0,360,0,140)}, 0.35)
    task.wait(0.35)

    -- Shake again
    task.spawn(function()
        for i = 1, 6 do
            Win2.Position = UDim2.new(0.5, 60 + math.random(-5,5), 0.5, -70 + math.random(-4,4))
            task.wait(0.05)
        end
        Win2.Position = UDim2.new(0.5,60,0.5,-70)
    end)

    task.wait(1.5)

    -- Show Win3 (ban screen)
    Win3.Visible = true
    Win3.BackgroundTransparency = 0
    Tween(Win3, {Size=UDim2.new(0,400,0,200)}, 0.4)
    task.wait(0.4)

    -- Shake all
    task.spawn(function()
        for i = 1, 10 do
            local ox = math.random(-8,8)
            local oy = math.random(-5,5)
            Win.Position = UDim2.new(0.5,-240+ox,0.5,-140+oy)
            Win2.Position = UDim2.new(0.5,60+ox,0.5,-70+oy)
            Win3.Position = UDim2.new(0.5,-260+ox,0.5,20+oy)
            task.wait(0.04)
        end
    end)
end)

-- Button interactions
local function CloseAll()
    for _, obj in ipairs(GUI:GetChildren()) do
        if obj:IsA("Frame") then
            Tween(obj, {BackgroundTransparency=1}, 0.3)
        end
    end
    task.wait(0.4)
    GUI:Destroy()
end

-- Clicking OK spawns more errors lol
local clickCount = 0
local function OnClick()
    clickCount = clickCount + 1
    if clickCount >= 3 then
        CloseAll()
    else
        -- Shake + new popup
        task.spawn(function()
            for i = 1, 6 do
                Win.Position = UDim2.new(0.5,-240+math.random(-8,8),0.5,-140+math.random(-5,5))
                task.wait(0.04)
            end
        end)
    end
end

OkBtn.MouseButton1Click:Connect(OnClick)
CancelBtn.MouseButton1Click:Connect(OnClick)
OkBtn2.MouseButton1Click:Connect(OnClick)
OkBtn3.MouseButton1Click:Connect(OnClick)
AppealBtn.MouseButton1Click:Connect(OnClick)

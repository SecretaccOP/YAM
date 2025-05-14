local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
local Window = Rayfield:CreateWindow({
   Name = "GhostPloit Universal Script",
   LoadingTitle = "GhostPloit Interface Suite",
   LoadingSubtitle = "by GhosGamer",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "GhostPloit INterface"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/XN4FuNG6", 
      RememberJoins = true 
   },
   KeySystem = true, 
   KeySettings = {
      Title = "GhostPloit",
      Subtitle = "Key System",
      Note = "This is Still the Alpha Version of the script so the key is for free - Key: Hello",
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = false,
      Key = {"Hello"} 
   }
})
 
local Tab = Window:CreateTab("Script", 4483362458)
local Tab2 = Window:CreateTab("Humanoid")
local Tab3 = Window:CreateTab("Script", nil) -- Title, Image
local Section2 = Tab2:CreateSection("Changes walkspeed, jumpheight, etc..")
local Section = Tab:CreateSection("Universal Scripts")
local Section3 = Tab3:CreateSection("FE Scripts")
 
Rayfield:Notify({
   Title = "Notification",
   Content = "This script is universal. Use alt instead of your main account to prevent ban",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})
 
local Button = Tab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
   end,
})
 
 
local Button = Tab:CreateButton({
   Name = "Jailbreak AutoRob (Universal) -- Suggested",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular'))()
   end,
})
 
local Button = Tab:CreateButton({
   Name = "Jailbreak AutoRob (ProjectAuto V4)",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/AutoRobV4Release"))()
   end,
})
 
local Button = Tab:CreateButton({
   Name = "BladeBall (FFJ Hub) V2 --Suggested",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
   end,
})
 
 
local Button = Tab:CreateButton({
   Name = "BladeBall (FFJ Hub) V3 --Key",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/BladeBallV3.lua"))()
   end,
})
 
 
local Button = Tab:CreateButton({
   Name = "Da Hood (AzureModded)",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
   end,
})
 
local Button = Tab:CreateButton({
   Name = "Asernal (Thunder) -- Good",
   Callback = function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/Arsenal-Thunder-Client-V2-12177"))()
   end,
})
 
-- Create the toggle for enabling/disabling walk speed change
-- Create the toggle for enabling/disabling walk speed change
local Toggle2 = 16
local Toggle
Toggle = Tab2:CreateToggle({
    Name = "Toggle Walkspeed",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        if Value == false then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Toggle2
            Rayfield:Notify({
               Title = "Notification",
               Content = "Walkspeed is toggled!",
               Duration = 3,
               Image = 4483362458,
            })
        end
    end,
})
 
-- Create the input for walk speed
local Input = Tab2:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "16",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        local check = Toggle.CurrentValue
        if Toggle.setting == false then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        else 
            local speed = tonumber(Text)
            Toggle2 = speed
            if speed then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
            else
                print("Invalid input. Please enter a number.")
            end
        end
    end
})
 
-- JUMP POWER
 
local Current_Jump_Power = 50
local Toggle = Tab2:CreateToggle({
   Name = "Toggle JumpPower",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            if Value == false then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
            else 
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = Current_Jump_Power
            end
   end,
})
 
local Input = Tab2:CreateInput({
   Name = "JumpPower",
   PlaceholderText = "50",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
        local jumppower = tonumber(Text)
                Current_Jump_Power = Text
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumppower
   end,
})
 
-- Max health 
local Current_MaxHealth = 0
 
local Toggle = Tab2:CreateToggle({
   Name = "Toggle MaxHealth",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            if Value == false then
                game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
            else 
                game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Current_MaxHealth
            end
 
   end,
})
 
local Input = Tab2:CreateInput({
   Name = "MaxHealth",
   PlaceholderText = "100",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Text
        Current_MaxHealth = Text
 
   end,
})
 
local Toggle = Tab2:CreateToggle({
   Name = "Toggle SuperJump (Press F)(Not recommend to use!)",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    -- Flying Script with Movement Controls
 
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")
 
    local flying = false
    local flySpeed = 50 -- Adjust this value to change the speed of flight
 
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F then
            flying = not flying
            if flying then
                humanoid.PlatformStand = true
                humanoid.Sit = true
                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                humanoid.Sit = false
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
            else
                humanoid.PlatformStand = false
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end
    end)
 
    game:GetService("RunService").Stepped:Connect(function()
        if flying then
            local moveVector = Vector3.new(0, 1, 0) -- Adjust this vector for direction and speed of movement
            player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(moveVector * flySpeed)
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Current_Jump_Power
    end
end)
 
   end,
})
 
 
--creating a Slider
local PlayerSlider = Tab2:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 300},
   Increment = 16,
   Suffix = "speed",
   CurrentValue = 10,
   Flag = "Walkspeed1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})
 
--creating a Slider
local Player2Slider = Tab2:CreateSlider({
   Name = "Jumpheight",
   Range = {0, 300},
   Increment = 16,
   Suffix = "height",
   CurrentValue = 10,
   Flag = "Jumpheight1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})
 
 
 
 
 
--new Tab
 
--new section
 
 
 
 
local Button111 = Tab3:CreateButton({
   Name = "Aimbot",
   Callback = function()
       local UIS = game.UserInputService
local camera = game.workspace.CurrentCamera
 
-- gets the closest player
function getClosest()
    local closestDistance = math.huge
    local closestPlayer = nil
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = v
            end
        end
    end
    return closestPlayer
end
 
-- starts the loop
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.aim = true
        while wait() do
            camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Character.Head.Position)
            if _G.aim == false then return end
        end
    end
end)
 
-- stops the loop
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.aim = false
    end
end)
 
   end,
})
 
 
 
--killaura
local Button12312312413413 = Tab3:CreateButton({
   Name = "Killaura",
   Callback = function()
       local connections = getgenv().configs and getgenv().configs.connection
if connections then
    local Disable = configs.Disable
    for i,v in connections do
        v:Disconnect() 
    end
    Disable:Fire()
    Disable:Destroy()
    table.clear(configs)
end
 
local Disable = Instance.new("BindableEvent")
getgenv().configs = {
    connections = {},
    Disable = Disable,
    Size = Vector3.new(10,10,10),
    DeathCheck = true
}
 
local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local lp = Players.LocalPlayer
local Run = true
local Ignorelist = OverlapParams.new()
Ignorelist.FilterType = Enum.RaycastFilterType.Include
 
local function getchar(plr)
    local plr = plr or lp
    return plr.Character
end
 
local function gethumanoid(plr: Player | Character)
    local char = plr:IsA("Model") and plr or getchar(plr)
 
    if char then
        return char:FindFirstChildWhichIsA("Humanoid")
    end
end
 
local function IsAlive(Humanoid)
    return Humanoid and Humanoid.Health > 0
end
 
local function GetTouchInterest(Tool)
    return Tool and Tool:FindFirstChildWhichIsA("TouchTransmitter",true)
end
 
local function GetCharacters(LocalPlayerChar)
    local Characters = {}
    for i,v in Players:GetPlayers() do
        table.insert(Characters,getchar(v))
    end
    table.remove(Characters,table.find(Characters,LocalPlayerChar))
    return Characters
end
 
local function Attack(Tool,TouchPart,ToTouch)
    if Tool:IsDescendantOf(workspace) then
        Tool:Activate()
        firetouchinterest(TouchPart,ToTouch,1)
        firetouchinterest(TouchPart,ToTouch,0)
    end
end
 
table.insert(getgenv().configs.connections,Disable.Event:Connect(function()
    Run = false
end))
 
while Run do
    local char = getchar()
    if IsAlive(gethumanoid(char)) then
        local Tool = char and char:FindFirstChildWhichIsA("Tool")
        local TouchInterest = Tool and GetTouchInterest(Tool)
 
        if TouchInterest then
            local TouchPart = TouchInterest.Parent
            local Characters = GetCharacters(char)
            Ignorelist.FilterDescendantsInstances = Characters
            local InstancesInBox = workspace:GetPartBoundsInBox(TouchPart.CFrame,TouchPart.Size + getgenv().configs.Size,Ignorelist)
 
            for i,v in InstancesInBox do
                local Character = v:FindFirstAncestorWhichIsA("Model")
 
                if table.find(Characters,Character) then
                    if getgenv().configs.DeathCheck then                    
                        if IsAlive(gethumanoid(Character)) then
                            Attack(Tool,TouchPart,v)
                        end
                    else
                        Attack(Tool,TouchPart,v)
                    end
                end
            end
        end
    end
    RunService.Heartbeat:Wait()
end
   end,
})
 
 
 
 
local Button = Tab3:CreateButton({
   Name = "Sword Killaura (change Range: m - n)",
   Callback = function()
 
 
            --// Message \\--
 
    --// Setting \\--
    local range = 15 --The deafult range for the script
    local rangeAddkeybind = Enum.KeyCode.M --Change the "E" to the keybind you want to use to add range.
    local rangeSubtractkeybind = Enum.KeyCode.N --Change the "Q" to the keybind you want to use to subtract range.
    local TogglePreciseRange = Enum.KeyCode.BackSlash --Change the "BackSlash" to the key you want to toggle precise range
    local DoNotDisturb = false --If its on true, the script will notifiy you if your range has been changed. if its false then it doesnt notify.
    local PreciseRange = false --Keep this off if you dont want your range value to have numbers that go into the 0.01's.
 
    --// Variable \\--
    local player = game:GetService("Players").LocalPlayer
    local UIS = game:GetService("UserInputService")
    local CoreGui = game:GetService("StarterGui")
 
    --// Keybind Functions \\--
    UIS.InputBegan:connect(function(input)
        if input.KeyCode == rangeSubtractkeybind then
            if PreciseRange == true then
                range = range - 0.01
            else
                range = range - 1
            end
            wait()
            if DoNotDisturb == false then
                game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Notification", Text = "the range was set to"..range})
            end
        end
    end)
 
    UIS.InputBegan:connect(function(input)
        if input.KeyCode == rangeAddkeybind then
            if PreciseRange == true then
                range = range + 0.01
            else
                range = range + 1
            end
            wait()
            if DoNotDisturb == false then
                game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Notification", Text = "the range was set to"..range})
            end
        end
    end)
 
    UIS.InputBegan:connect(function(input)
        if input.KeyCode == TogglePreciseRange then
            if PreciseRange == false then
                PreciseRange = true
                if DoNotDisturb == false then
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Notification", Text = "the Precise range was set to true"})
                end
            else
                PreciseRange = false
                if DoNotDisturb == false then
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Notification", Text = "the Precise range was set to false"})
                end
            end
 
        end
    end)
 
    --// Script \\--
    game:GetService("RunService").RenderStepped:Connect(function()
        local p = game.Players:GetPlayers()
        for i = 2, #p do local v = p[i].Character
            if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(v.HumanoidRootPart.Position) <= range then
                local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild("Handle") then
                    tool:Activate()
                    for i,v in next, v:GetChildren() do
                        if v:IsA("BasePart") then
                            firetouchinterest(tool.Handle,v,0)
                            firetouchinterest(tool.Handle,v,1)
                        end
                    end
                end
            end
        end
    end)
 
    if DoNotDisturb == false then
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Script Load", Text = "the script loaded successfully!"})
    end
end,
})
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
local Section4 = Tab3:CreateSection("ESP")
 
 
local Button1111 = Tab3:CreateButton({
   Name = "Player ESP",
   Callback = function()
       local Players = game:GetService("Players")
 
local function createESP(player, fillColor, fillTransparency, outlineTransparency)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = player.Character
    highlight.Parent = player.Character
    highlight.FillColor = fillColor or Color3.new(1, 0, 0) -- Default to red color if none provided
    highlight.FillTransparency = fillTransparency or 0.5
    highlight.OutlineTransparency = outlineTransparency or 0
end
 
local function applyESP(player, fillColor, fillTransparency, outlineTransparency)
    player.CharacterAdded:Connect(function(character)
        createESP(player, fillColor, fillTransparency, outlineTransparency)
    end)
    -- Apply ESP to existing character if the player already has one
    if player.Character then
        createESP(player, fillColor, fillTransparency, outlineTransparency)
    end
end
 
local function removeESP(player)
    if player.Character then
        for _, v in pairs(player.Character:GetChildren()) do
            if v:IsA("Highlight") then
                v:Destroy()
            end
        end
    end
end
 
local function onPlayerAdded(player)
    applyESP(player, Color3.new(1, 0, 0), 0.5, 0)
end
 
local function onPlayerRemoving(player)
    removeESP(player)
end
 
-- Connect existing players
for _, player in pairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end
 
-- Connect player added and removing events
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
 
   end,
})
 
 
 
--Name + Distance
local Button11111 = Tab3:CreateButton({
   Name = "Name + Distance",
   Callback = function()
       --This script is for those games that won't let you use a GUI
--Once executing, the ESP is instant.
 
 
-- Function to update player ESP distance
local function updatePlayerESP()
    local localCharacter = game.Players.LocalPlayer.Character
    if not localCharacter then
        return
    end
 
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (localCharacter.Head.Position - player.Character.Head.Position).Magnitude
            local billboardGui = player.Character.Head:FindFirstChild("TadachiisESPTags") -- Check if the BillboardGui exists
            if not billboardGui then -- Only create a new one if it doesn't exist
                billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "TadachiisESPTags" -- Use the correct name for the BillboardGui
                billboardGui.Adornee = player.Character.Head
                billboardGui.Size = UDim2.new(0, 100, 0, 50) -- fixed size for the BillboardGui
                billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- adjust the vertical offset as needed
                billboardGui.AlwaysOnTop = true
                billboardGui.LightInfluence = 1
                billboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                billboardGui.Parent = player.Character.Head
 
                local textLabel = Instance.new("TextLabel")
                textLabel.Name = "NameLabel" -- Use the correct name for the label
                textLabel.Text = player.Name .. "\nDistance: " .. math.floor(distance)
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1 -- transparent background
                textLabel.TextColor3 = Color3.new(1, 0, 0) -- red text for the player's name
                textLabel.TextScaled = true
                textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- black text stroke
                textLabel.TextStrokeTransparency = 0 -- fully opaque text stroke (visible through walls)
                textLabel.Visible = true -- ESP is always visible without a GUI
                textLabel.Parent = billboardGui
            else
                billboardGui.NameLabel.Text = player.Name .. "\nDistance: " .. math.floor(distance) -- Update the distance text
            end
        end
    end
end
 
-- Call updatePlayerESP() initially and then schedule it to be called every 0.01 seconds
updatePlayerESP()
game:GetService("RunService").Heartbeat:Connect(function()
    updatePlayerESP()
end)
   end,
})
 
 
 
--Tracer ESP
local Button11111 = Tab3:CreateButton({
   Name = "Tracer ESP",
   Callback = function()
      local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
 
local LocalPlayer = Players.LocalPlayer
local tracers = {}
 
local function createTracer(player)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
 
    local tracer = Drawing.new("Line")
    tracer.Color = Color3.new(1, 0, 0) -- Red color
    tracer.Thickness = 2
    tracer.Transparency = 1
    tracers[player] = tracer
end
 
local function removeTracer(player)
    if tracers[player] then
        tracers[player]:Remove()
        tracers[player] = nil
    end
end
 
local function updateTracers()
    for player, tracer in pairs(tracers) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            if onScreen then
                tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                tracer.Visible = true
            else
                tracer.Visible = false
            end
        else
            tracer.Visible = false
        end
    end
end
 
local function onCharacterAdded(player)
    createTracer(player)
end
 
local function onCharacterRemoving(player)
    removeTracer(player)
end
 
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function()
        onCharacterAdded(player)
    end)
    player.CharacterRemoving:Connect(function()
        onCharacterRemoving(player)
    end)
    if player.Character then
        onCharacterAdded(player)
    end
end
 
local function onPlayerRemoving(player)
    removeTracer(player)
end
 
-- Connect existing players
for _, player in pairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end
 
-- Connect player added and removing events
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
 
RunService.RenderStepped:Connect(updateTracers)
 
   end,
})
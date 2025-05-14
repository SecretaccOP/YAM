--SkipperHub!!!

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "💫Skippers Mod Menu💫 | Free",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Free v3",
   LoadingSubtitle = "by Skipper",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Skipper Mod Menu | Free",
      Subtitle = "Key System",
      Note = "Key System even tho it´s Free | In Discord!", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"GUI"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


Rayfield:Notify({
   Title = "Thanks for using our Script!",
   Content = "have fun!",
   Duration = 10,
   Image = 4483362458,
})

local ESPTab = Window:CreateTab("🟥Esp Opptions🟥", 4483362458) -- Title, Image
local ESPSection = ESPTab:CreateSection("🟥ESP🟥")


local AIMTab = Window:CreateTab("🔫Aim Oppitions🔫", 4483362458) -- Title, Image
local AIMSection = AIMTab:CreateSection("🔫Aimbot")


local STUFFTab = Window:CreateTab("➕Other Stuff➕", 4483362458) -- Title, Image
local STUFFSection = STUFFTab:CreateSection("➕Stuff➕")


local ScrTab = Window:CreateTab("☁️Scripthubs Opptions☁️", 4483362458) -- Title, Image
local ScrSection = ScrTab:CreateSection("☁️Hubs☁️")


local DISTab = Window:CreateTab("✨Discord✨", 4483362458) -- Title, Image
local DISSection = DISTab:CreateSection("✨https://discord.gg/mDnAFVs8✨")


    
local Button = ESPTab:CreateButton({
   Name = "🔴Tracer (Everyone)🔴",
   Callback = function()
   -- LocalScript in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

-- Tracer-Einstellungen
local function createTracer()
	local tracer = Drawing.new("Line")
	tracer.Color = Color3.fromRGB(225,27,27)
	tracer.Thickness = 1.5
	tracer.Transparency = 1
	tracer.Visible = true
	return tracer
end

-- Spieler ESP hinzufügen (Highlight + Tracer)
local trackedPlayers = {}

local function addESP(targetPlayer)
	if targetPlayer == localPlayer then return end

	local function onCharacterAdded(character)
		-- Highlight hinzufügen
		local highlight = Instance.new("Highlight")
		highlight.FillColor = Color3.fromRGB(0, 255, 0)
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 1
		highlight.Adornee = character
		highlight.Parent = character

		-- Tracer erstellen
		local tracer = createTracer()
		trackedPlayers[targetPlayer] = {
			character = character,
			tracer = tracer
		}
	end

	if targetPlayer.Character then
		onCharacterAdded(targetPlayer.Character)
	end

	targetPlayer.CharacterAdded:Connect(onCharacterAdded)
end

-- Alle bestehenden Spieler tracken
for _, player in pairs(Players:GetPlayers()) do
	addESP(player)
end

-- Neue Spieler tracken
Players.PlayerAdded:Connect(function(player)
	addESP(player)
end)

-- Update Tracers jedes Frame
RunService.RenderStepped:Connect(function()
	for player, data in pairs(trackedPlayers) do
		local character = data.character
		local tracer = data.tracer

		if character and character:FindFirstChild("HumanoidRootPart") then
			local hrp = character.HumanoidRootPart
			local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
			if onScreen then
				local bottomOfScreen = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
				tracer.From = bottomOfScreen
				tracer.To = Vector2.new(screenPos.X, screenPos.Y)
				tracer.Visible = true
			else
				tracer.Visible = false
			end
		else
			tracer.Visible = false
		end
	end
end)
   end,
})


local Button = ScrTab:CreateButton({
   Name = "☁️Infinity Yield☁️",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})


local Button = ScrTab:CreateButton({
   Name = "☁️Solara Hub v3☁️",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()
   end,
})


local Button = ScrTab:CreateButton({
   Name = "☁️Chat Troller☁️ (Patched)",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/ffedex/characters/refs/heads/main/chars', true))()
   end,
})


local Button = STUFFTab:CreateButton({
   Name = "✖️Walkspeed✖️",
   Callback = function()
    local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CharacterAdded = Player.CharacterAdded
 
local function createUI()
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    
    -- Create the GUI elements
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    ScreenGui.Name = "WalkSpeedGUI"
 
    -- Create the frame for the slider
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 420, 0, 120)
    Frame.Position = UDim2.new(0.5, -210, 0.8, -60)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui
    -- Add rounded corners to the frame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = Frame
 
    -- Create the title text
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = "WalkSpeed Slider"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 22
    Title.Font = Enum.Font.GothamBold
    Title.TextStrokeTransparency = 0.8
    Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Parent = Frame
 
    -- Create the slider container
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(1, -40, 0, 10)
    Slider.Position = UDim2.new(0, 20, 0, 50)
    Slider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    Slider.BorderSizePixel = 0
    Slider.Parent = Frame
    -- Add rounded corners to the slider container
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 5)
    SliderCorner.Parent = Slider
 
    -- Create the slider button
    local SliderButton = Instance.new("Frame")
    SliderButton.Size = UDim2.new(0, 20, 1, 0)
    SliderButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    SliderButton.BorderSizePixel = 0
    SliderButton.Parent = Slider
    -- Add rounded corners to the slider button
    local SliderButtonCorner = Instance.new("UICorner")
    SliderButtonCorner.CornerRadius = UDim.new(0, 10)
    SliderButtonCorner.Parent = SliderButton
 
    -- Create gradient effect for the slider button
    local Gradient = Instance.new("UIGradient")
    Gradient.Rotation = 45
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 0))
    })
    Gradient.Parent = SliderButton
 
    -- Function to update walkspeed based on slider position
    local function updateWalkSpeed()
        -- Get the X position of the slider button
        local sliderPosition = SliderButton.Position.X.Offset / Slider.AbsoluteSize.X
        -- Debugging: Print the slider position and walk speed
        print("Slider Position:", sliderPosition)
        -- Ensure the walk speed is within a reasonable range, clamp it between 16 and 500
        Humanoid.WalkSpeed = math.clamp(sliderPosition * 500, 16, 500)
        print("Updated WalkSpeed:", Humanoid.WalkSpeed)
    end
 
    -- Dragging logic
    local dragging = false
    local mouse = Player:GetMouse()
 
    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
 
    SliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
 
    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            -- Calculate the new position of the slider button based on the mouse's X position
            local sliderWidth = Slider.AbsoluteSize.X
            local newX = math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, sliderWidth)
            -- Set the slider button position with a smooth tween effect
            TweenService:Create(SliderButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, newX, 0, 0)}):Play()
            -- Update WalkSpeed continuously as the button is moved
            updateWalkSpeed()
        end
    end)
 
    -- Initial walk speed setup
    updateWalkSpeed()
end
 
-- Recreate UI every time the player respawns
CharacterAdded:Connect(function()
    -- Clean up any existing UI if it exists
    if Player:FindFirstChild("PlayerGui") and Player.PlayerGui:FindFirstChild("WalkSpeedGUI") then
        Player.PlayerGui:FindFirstChild("WalkSpeedGUI"):Destroy()
    end
    -- Create a new UI after respawn
    createUI()
end)
 
-- Create the UI for the first time
createUI()
   
   end,
})

local Button = STUFFTab:CreateButton({
   Name = "✖️Jump Power✖️",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
 
-- Ensure humanoid updates on respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = newCharacter:WaitForChild("Humanoid")
end)
 
-- Create UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
 
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 50)
frame.Position = UDim2.new(0.5, -100, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Dark grey
frame.BorderSizePixel = 0
frame.Active = true -- Needed for dragging
frame.Draggable = true -- Makes the frame draggable
frame.Parent = screenGui
 
-- Rounded Edges
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.2, 0)
uiCorner.Parent = frame
 
local label = Instance.new("TextLabel")
label.Text = "Jump Power:"
label.Size = UDim2.new(0, 100, 1, 0)
label.Position = UDim2.new(0, 5, 0, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1, 1, 1) -- White
label.TextScaled = true
label.Font = Enum.Font.SourceSans
label.Parent = frame
 
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 80, 0.8, 0)
textBox.Position = UDim2.new(1, -85, 0.1, 0)
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Slightly darker grey
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Text = "" -- Starts empty
textBox.TextScaled = true
textBox.Font = Enum.Font.SourceSans
textBox.Parent = frame
 
local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0.2, 0)
uiCorner2.Parent = textBox
 
-- Default Jump Power
local defaultJumpPower = humanoid.JumpPower
 
-- Update Jump Power
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newJumpPower = tonumber(textBox.Text)
        if newJumpPower and newJumpPower > 0 then
            humanoid.JumpPower = newJumpPower
        else
            textBox.Text = ""
            humanoid.JumpPower = defaultJumpPower -- Reset to default
        end
    end
end)
   end,
})


local Button = STUFFTab:CreateButton({
   Name = "➕Fling➕",
   Callback = function()
   local Players = game:GetService("Players")
local Player = Players.LocalPlayer
 
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton") -- Close button
 
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
 
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Active = true
Frame.Draggable = true
 
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Enter username"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14
 
TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton.Position = UDim2.new(0.1, 0, 0.5, 0)
TextButton.Size = UDim2.new(0.8, 0, 0.4, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "FLING!"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 20
 
-- Close button properties
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
 
local function GetPlayer(Name)
    Name = Name:lower()
    for _, x in next, Players:GetPlayers() do
        if x ~= Player then
            if x.Name:lower():match("^" .. Name) or x.DisplayName:lower():match("^" .. Name) then
                return x
            end
        end
    end
    return nil
end
 
local function Message(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end
 
local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
 
    local TCharacter = TargetPlayer.Character
    local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter and TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")
 
    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit then
            return Message("Error Occurred", "Target is sitting", 5)
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
 
        local function FPos(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
 
        local function SFBasePart(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0
 
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100
 
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
 
        workspace.FallenPartsDestroyHeight = 0/0
 
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
 
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
 
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        end
 
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
 
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end
 
TextButton.MouseButton1Click:Connect(function()
    local targetName = TextBox.Text
    local targetPlayer = GetPlayer(targetName)
 
    if targetPlayer then
        SkidFling(targetPlayer)
    else
        Message("Error Occurred", "Invalid username", 5)
    end
end)
 
-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
end)
   end,
})

local Toggle = STUFFTab:CreateButton({
    Name = "✖️Bunny Sprint✖️",
    Callback = function(Value)
        -- Movement settings
local STRAFE_SPEED = 30
local AIR_MULTIPLIER = 1.5
local BHOP_POWER = 40

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Local player setup
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Variables
local moveKeys = {
    W = false,
    A = false,
    S = false,
    D = false,
    Space = false
}

-- Functions to handle character access safely
local function getChar()
    return player.Character or player.CharacterAdded:Wait()
end

local function getRoot()
    local char = getChar()
    return char:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = getChar()
    return char:FindFirstChild("Humanoid")
end

-- Movement function
local function calculateMoveDirection()
    local dir = Vector3.new(0, 0, 0)
    local char = getChar()
    if not char then return dir end
    
    local cf = workspace.CurrentCamera.CFrame
    
    if moveKeys.W then
        dir = dir + cf.LookVector
    end
    if moveKeys.S then
        dir = dir - cf.LookVector
    end
    if moveKeys.A then
        dir = dir - cf.RightVector
    end
    if moveKeys.D then
        dir = dir + cf.RightVector
    end
    
    dir = Vector3.new(dir.X, 0, dir.Z).Unit
    return dir
end

-- Key handling
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.W then
        moveKeys.W = true
    elseif input.KeyCode == Enum.KeyCode.A then
        moveKeys.A = true
    elseif input.KeyCode == Enum.KeyCode.S then
        moveKeys.S = true
    elseif input.KeyCode == Enum.KeyCode.D then
        moveKeys.D = true
    elseif input.KeyCode == Enum.KeyCode.Space then
        moveKeys.Space = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.W then
        moveKeys.W = false
    elseif input.KeyCode == Enum.KeyCode.A then
        moveKeys.A = false
    elseif input.KeyCode == Enum.KeyCode.S then
        moveKeys.S = false
    elseif input.KeyCode == Enum.KeyCode.D then
        moveKeys.D = false
    elseif input.KeyCode == Enum.KeyCode.Space then
        moveKeys.Space = false
    end
end)

-- Main movement loop
RunService.Heartbeat:Connect(function()
    local char = getChar()
    local root = getRoot()
    local humanoid = getHumanoid()
    
    if not char or not root or not humanoid then return end
    
    -- Calculate movement
    local moveDir = calculateMoveDirection()
    local isInAir = humanoid:GetState() == Enum.HumanoidStateType.Jumping or 
                    humanoid:GetState() == Enum.HumanoidStateType.Freefall
    
    -- Apply movement
    if moveDir.Magnitude > 0 then
        local speed = STRAFE_SPEED
        if isInAir then
            speed = speed * AIR_MULTIPLIER
        end
        
        -- Set velocity
        local newVel = moveDir * speed
        root.Velocity = Vector3.new(
            newVel.X,
            root.Velocity.Y,  -- Preserve vertical velocity
            newVel.Z
        )
        
        -- Bunny hop
        if moveKeys.Space and root.Velocity.Y < 1 then
            root.Velocity = Vector3.new(
                root.Velocity.X,
                BHOP_POWER,
                root.Velocity.Z
            )
        end
    end
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Movement Script Loaded",
    Text = "Controls: WASD to move, Space to jump",
    Duration = 5
})
    end,
})


local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local LockedPlayer = nil
local LastKnownPosition = nil
local FieldOfView = 40 -- Set the field of view to 40 degrees
local CenterPrioritizationFactor = 0.5 -- Decrease this value to shrink the priority "circle"
local AimbotEnabled = false -- Track whether the aimbot is enabled or not

-- Function to check if a player is on the enemy team
local function isEnemyTeam(player)
    -- If the local player has no team, or the target player has no team, return false
    if not LocalPlayer.Team or not player.Team then
        return false
    end
    
    -- Return true if the teams are different
    return LocalPlayer.Team ~= player.Team
end

-- Function to get the body part based on weighted probabilities
local function getTargetBodyPart()
    local randomValue = math.random()
    if randomValue <= 0.7 then
        return "UpperTorso" -- 70% chance
    else
        return "Head" -- 30% chance
    end
end

-- Function to get the closest enemy player to the crosshair, prioritizing players near the center of the screen and closest to the player
local function getClosestEnemyPlayerToCrosshair()
    local mousePosition = UserInputService:GetMouseLocation()
    local closestPlayer = nil
    local closestDistance = math.huge
    local cameraPosition = Camera.CFrame.Position
    local cameraForward = Camera.CFrame.LookVector
    local centerOfScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, player in pairs(Players:GetPlayers()) do
        -- Only target players who are on the enemy team
        if player ~= LocalPlayer and player.Character and isEnemyTeam(player) then
            -- Choose body part based on weighted probability
            local targetBodyPartName = getTargetBodyPart()
            local bodyPart = player.Character:FindFirstChild(targetBodyPartName)
            
            if bodyPart then
                local screenPosition, onScreen = Camera:WorldToViewportPoint(bodyPart.Position)

                if onScreen then
                    local playerPosition = bodyPart.Position - cameraPosition
                    local angle = math.acos(cameraForward:Dot(playerPosition.Unit)) * (180 / math.pi)

                    -- Check if the player is within the FOV
                    if angle <= FieldOfView / 2 then
                        -- Calculate screen distance (distance between mouse and player)
                        local screenDist = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude
                        -- Calculate distance from the center of the screen, but apply the CenterPrioritizationFactor to shrink the circle
                        local distanceFromCenter = (Vector2.new(screenPosition.X, screenPosition.Y) - centerOfScreen).Magnitude * CenterPrioritizationFactor
                        -- Calculate the distance from the local player to the target player
                        local distanceToPlayer = (LocalPlayer.Character.Head.Position - bodyPart.Position).Magnitude

                        -- Combine these factors:
                        -- Prioritize players close to the center and those closer to the local player
                        local weightedScore = screenDist + distanceFromCenter + distanceToPlayer

                        -- Find the closest player based on the combined score
                        if weightedScore < closestDistance then
                            closestDistance = weightedScore
                            closestPlayer = {player = player, bodyPart = targetBodyPartName}
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

-- Function to lock the camera onto the target player's body part
local function lockCameraOnPlayer(targetData)
    if targetData and targetData.player.Character then
        local bodyPart = targetData.player.Character:FindFirstChild(targetData.bodyPart)
        
        if bodyPart then
            LockedPlayer = targetData.player
            LastKnownPosition = bodyPart.Position

            RunService:BindToRenderStep("LockCamera", Enum.RenderPriority.Camera.Value, function()
                if LockedPlayer and LockedPlayer.Character and isEnemyTeam(LockedPlayer) then
                    local currentBodyPart = LockedPlayer.Character:FindFirstChild(targetData.bodyPart)
                    
                    if currentBodyPart then
                        local targetPosition = currentBodyPart.Position

                        -- Check if the player has moved more than 5 meters
                        if (targetPosition - LastKnownPosition).Magnitude > 5 then
                            -- Stop tracking if the player has teleported more than 5 meters
                            RunService:UnbindFromRenderStep("LockCamera")
                            LockedPlayer = nil
                            LastKnownPosition = nil
                            return
                        end

                        -- Update the last known position
                        LastKnownPosition = targetPosition

                        -- Lock the camera onto the player's body part
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                    else
                        RunService:UnbindFromRenderStep("LockCamera")
                        LockedPlayer = nil
                        LastKnownPosition = nil
                    end
                else
                    RunService:UnbindFromRenderStep("LockCamera")
                    LockedPlayer = nil
                    LastKnownPosition = nil
                end
            end)
        end
    end
end

-- Rayfield UI Toggle for Aimbot
local Toggle = AIMTab:CreateToggle({
    Name = "🔫Aimbot🔫 (RCLICK)",
    CurrentValue = false,
    Flag = "AIM1", -- A flag is the identifier for the configuration file
    Callback = function(Value)
        -- The function that takes place when the toggle is pressed
        AimbotEnabled = Value
        if not AimbotEnabled then
            -- Stop tracking if the aimbot is disabled
            RunService:UnbindFromRenderStep("LockCamera")
            LockedPlayer = nil
            LastKnownPosition = nil
        end
    end,
})

-- Detect right-click and lock onto the closest enemy player within FOV, only if Aimbot is enabled
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton2 and AimbotEnabled then
        local closestPlayer = getClosestEnemyPlayerToCrosshair()
        lockCameraOnPlayer(closestPlayer)
    end
end)

-- Stop locking the camera when right-click is released
UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        RunService:UnbindFromRenderStep("LockCamera")
        LockedPlayer = nil
        LastKnownPosition = nil
    end
end)

-- This next part is for silent aim, you can modify the vectors to change how good the silent aim is
-- Function to get the Players service name dynamically
local function getPlayersName()
    for i, v in pairs(game:GetChildren()) do
        if v.ClassName == "Players" then
            return v.Name
        end
    end
end

local playersService = getPlayersName()
local localPlayer = game[playersService].LocalPlayer

-- Global variables to control the script
local isModificationEnabled = false
local modificationCoroutine = nil

-- Function to modify player character parts
local function modifyPlayerParts()
    while isModificationEnabled do
        for _, v in pairs(game[playersService]:GetPlayers()) do
            if v.Name ~= localPlayer.Name and v.Character then
                local parts = {
                    "RightUpperLeg", 
                    "LeftUpperLeg", 
                    "HeadHB", 
                    "HumanoidRootPart"
                }
                
                for _, partName in ipairs(parts) do
                    local part = v.Character:FindFirstChild(partName)
                    if part then
                        part.CanCollide = false
                        part.Transparency = 10
                        part.Size = Vector3.new(10, 10, 10)
                    end
                end
            end
        end
        wait(1)  -- Wait for 1 second before next iteration
    end
    
    -- Reset parts when modification is disabled
    for _, v in pairs(game[playersService]:GetPlayers()) do
        if v.Name ~= localPlayer.Name and v.Character then
            local parts = {
                "RightUpperLeg", 
                "LeftUpperLeg", 
                "HeadHB", 
                "HumanoidRootPart"
            }
            
            for _, partName in ipairs(parts) do
                local part = v.Character:FindFirstChild(partName)
                if part then
                    part.CanCollide = true
                    part.Transparency = 0
                    part.Size = Vector3.new(1, 1, 1)
                end
            end
        end
    end
end

-- Create Toggle for Player Part Modification
local Toggle = AIMTab:CreateToggle({
    Name = "🔫silent aim🔫",
    CurrentValue = false,
    Flag = "PlayerPartModification",
    Callback = function(Value)
        isModificationEnabled = Value
        
        if Value then
            -- Start the modification coroutine
            modificationCoroutine = coroutine.create(modifyPlayerParts)
            coroutine.resume(modificationCoroutine)
        else
            -- If the coroutine is running, it will exit due to isModificationEnabled being false
            modificationCoroutine = nil
        end
    end,
})


local Toggle = AIMTab:CreateToggle({
    Name = "🔫TriggerBot🔫",
    CurrentValue = false,
    Flag = "EnemyAutoClickToggle",
    Callback = function(Value)
        if Value then
            -- Activate auto-click
            getgenv().AutoClickConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local Mouse = LocalPlayer:GetMouse()

                if Mouse.Target and Mouse.Target.Parent then
                    local TargetPlayer = Players:GetPlayerFromCharacter(Mouse.Target.Parent)
                    
                    if TargetPlayer and TargetPlayer ~= LocalPlayer then
                        if not TargetPlayer.Team or TargetPlayer.Team ~= LocalPlayer.Team then
                            mouse1press()
                            wait()
                            mouse1release()
                        end
                    end
                end
            end)
        else
            -- Deactivate auto-click
            if getgenv().AutoClickConnection then
                getgenv().AutoClickConnection:Disconnect()
            end
        end
    end
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variables for ESP
local espEnabled = false -- Tracks the ESP state
local espConnection -- Stores the RenderStepped connection for ESP updates

-- Variables for Tracers
local drawLinesEnabled = false
local lines = {} -- Store all the lines
local tracerConnection -- Stores the RenderStepped connection for tracers

-- Function to create a hollow rectangle with thicker borders (ESP box)
local function createHollowBox()
    local box = Instance.new("BillboardGui")
    box.Size = UDim2.new(4, 0, 5, 0)
    box.AlwaysOnTop = true
    box.Adornee = nil
    box.Name = "PlayerBox"

    local borderThickness = 0.05 -- Increased from 0.03 to make borders thicker

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, borderThickness, 0)
    top.Position = UDim2.new(0, 0, 0, 0)
    top.BackgroundColor3 = Color3.new(1, 0, 0)
    top.BorderSizePixel = 0
    top.Parent = box

    local bottom = Instance.new("Frame")
    bottom.Size = UDim2.new(1, 0, borderThickness, 0)
    bottom.Position = UDim2.new(0, 0, 1 - borderThickness, 0)
    bottom.BackgroundColor3 = Color3.new(1, 0, 0)
    bottom.BorderSizePixel = 0
    bottom.Parent = box

    local left = Instance.new("Frame")
    left.Size = UDim2.new(borderThickness, 0, 1, 0)
    left.Position = UDim2.new(0, 0, 0, 0)
    left.BackgroundColor3 = Color3.new(1, 0, 0)
    left.BorderSizePixel = 0
    left.Parent = box

    local right = Instance.new("Frame")
    right.Size = UDim2.new(borderThickness, 0, 1, 0)
    right.Position = UDim2.new(1 - borderThickness, 0, 0, 0)
    right.BackgroundColor3 = Color3.new(1, 0, 0)
    right.BorderSizePixel = 0
    right.Parent = box

    return box
end

-- Function to check if a player is on the enemy team
local function isEnemyTeam(player)
    return player.Team ~= LocalPlayer.Team
end

-- Function to highlight all enemy players (ESP)
local function highlightAllPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isEnemyTeam(player) then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character:FindFirstChild("PlayerBox") then
                    local box = createHollowBox()
                    box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                    box.Parent = player.Character
                end
            end
        else
            if player.Character and player.Character:FindFirstChild("PlayerBox") then
                player.Character.PlayerBox:Destroy()
            end
        end
    end
end

-- Clean up highlights when players leave
local function onPlayerRemoving(player)
    if player.Character and player.Character:FindFirstChild("PlayerBox") then
        player.Character.PlayerBox:Destroy()
    end
end

-- Enable or disable ESP
local function toggleESP(state)
    if state then
        espConnection = RunService.RenderStepped:Connect(highlightAllPlayers)
        Players.PlayerRemoving:Connect(onPlayerRemoving)
    else
        if espConnection then
            espConnection:Disconnect()
            espConnection = nil
        end
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("PlayerBox") then
                player.Character.PlayerBox:Destroy()
            end
        end
    end
end

-- Function to create and update tracers (lines)
local function createLine()
    local line = Drawing.new("Line")
    line.Visible = true
    line.Thickness = 3 -- Increased from 1 to make lines thicker
    line.Color = Color3.new(1, 0, 0)
    return line
end

local function updateLines()
    -- Hide all lines first
    for _, line in ipairs(lines) do
        line.Visible = false
    end

    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local index = 1
    for _, player in ipairs(Players:GetPlayers()) do
        -- Only draw lines to enemy team players
        if player ~= LocalPlayer and isEnemyTeam(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local rootPart = character.HumanoidRootPart
            local worldPosition = rootPart.Position
            local screenPosition, onScreen = Camera:WorldToViewportPoint(worldPosition)

            if onScreen then
                local line = lines[index] or createLine()
                line.From = screenCenter
                line.To = Vector2.new(screenPosition.X, screenPosition.Y)
                line.Visible = true

                lines[index] = line
                index = index + 1
            end
        end
    end

    -- Hide remaining lines if there are no players to connect to
    for i = index, #lines do
        lines[i].Visible = false
    end
end

local function cleanupLines()
    -- Clean up the lines by making them invisible and removing them
    for _, line in ipairs(lines) do
        line.Visible = false
        line:Remove()
    end
    lines = {}
end

-- Toggle for tracers (line drawing)
local function toggleLineDrawing(state)
    if state then
        tracerConnection = RunService.RenderStepped:Connect(updateLines)
    else
        if tracerConnection then
            tracerConnection:Disconnect()
            tracerConnection = nil
        end
        cleanupLines()
    end
end

-- Rayfield UI Toggles

-- ESP Toggle
ESPTab:CreateToggle({
    Name = "🔴Enemy Boxes🔴",
    CurrentValue = false,
    Flag = "BOX1",
    Callback = function(Value)
        espEnabled = Value
        toggleESP(Value)
    end,
})

-- Tracers Toggle
ESPTab:CreateToggle({
    Name = "🔴Tracer (Enemys)🔴",
    CurrentValue = false,
    Flag = "Tracer1",
    Callback = function(Value)
        drawLinesEnabled = Value
        toggleLineDrawing(Value)
    end,
})

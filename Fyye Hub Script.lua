-- BİG UPDATE V0.8
 
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
local Window = Rayfield:CreateWindow({
   Name = "Fyye_Hub V0.8",
   Icon = 0,
   LoadingTitle = "Fyye Hub",
   LoadingSubtitle = "by Furkan",
   Theme = "Default",
 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
 
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Fyye Hub"
   },
 
   Discord = {
      Enabled = true,
      Invite = "discord.gg/CNQAS4h2WW",
      RememberJoins = true
   },
 
   KeySystem = true,
   KeySettings = {
      Title = "Fyye_Hub | Key",
      Subtitle = "Key System",
      Note = "Join The Discord Server Get Key | discord.gg/CNQAS4h2WW",
      FileName = "FyyeHubKey",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/H5enL3jR"}
   }
})
 
local MainTab = Window:CreateTab("🏠 Home", nil)
local MainSection = MainTab:CreateSection("Main")
 
Rayfield:Notify({
   Title = "Executed Script",
   Content = "Fyye Hub",
   Duration = 5,
   Image = nil,
})
 
local Button = MainTab:CreateButton({
   Name = "On İnfinite Jump",
   Callback = function()
   InfiniteJumpEnabled = true game:GetService('UserInputService').JumpRequest:connect(function() if InfiniteJumpEnabled then game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState('Jumping')end end)
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Off İnfinite Jump",
   Callback = function()
   InfiniteJumpEnabled = false game:GetService('UserInputService').JumpRequest:connect(function() if InfiniteJumpEnabled then game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState('Jumping')end end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Unıversal Aimbot (Press Shift)",
   Callback = function()
   local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local aimSpeed = 1
local isAiming = false
local aimingTarget = nil
local maxDistance = 100

function findNearestPlayer()
    local nearestTarget = nil
    local shortestDistance = maxDistance

    for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local character = otherPlayer.Character
            local head = character:FindFirstChild("Head")

            if head then
                local distance = (head.Position - player.Character.Head.Position).Magnitude

                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestTarget = head
                end
            end
        end
    end

    return nearestTarget
end

function aimAt(target)
    if target then
        local currentCFrame = camera.CFrame
        local targetPosition = target.Position
        local direction = (targetPosition - currentCFrame.Position).Unit
        local targetCFrame = CFrame.new(currentCFrame.Position, currentCFrame.Position + direction)

        camera.CFrame = currentCFrame:Lerp(targetCFrame, aimSpeed)
    end
end

local function onPlayerDeath()
    aimingTarget = nil
    isAiming = false
    local target = findNearestPlayer()
    if target then
        aimingTarget = target
        isAiming = true
    end
end

if player.Character and player.Character:FindFirstChild("Humanoid") then
    player.Character.Humanoid.Died:Connect(onPlayerDeath)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        isAiming = true

        local target = findNearestPlayer()
        if target then
            aimingTarget = target
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        isAiming = false
        aimingTarget = nil
    end
end)

while true do
    if isAiming then
        local target = aimingTarget

        if target and not target.Parent then
            aimingTarget = nil
            target = findNearestPlayer()
        end
        
        if target then
            aimAt(target)
        end
    end
    wait(0.01)
end

   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Hitbox",
   Callback = function()
   local HeadSize = 20
local IsDisabled = true
local IsTeamCheckEnabled = false 
 
game:GetService('RunService').RenderStepped:Connect(function()
    if IsDisabled then
        local localPlayer = game:GetService('Players').LocalPlayer
        if not localPlayer then return end
        
        local localPlayerTeam = localPlayer.Team
        
        for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
            if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Size = Vector3.new(HeadSize, HeadSize, HeadSize)
                    humanoidRootPart.Transparency = 1
                    humanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    humanoidRootPart.Material = Enum.Material.Neon
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)
   end,
})
 
local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})
 
local Slider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {50, 300},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 50,
   Flag = "Slider1", 
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Esp",
   Callback = function()
   local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "İnfinite Yield",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
   end,
})

local FlingTab = Window:CreateTab("⬅ Fling This And People", nil)
local FlingSection = FlingTab:CreateSection("Scripts")
 
local Button = FlingTab:CreateButton({
   Name = "Posion Script (Off Press P)",
   Callback = function()
   print("Poison Loaded!") local userinputs = game:GetService("UserInputService") local w = game:GetService("Workspace") local r = game:GetService("RunService") local poison_part1 = workspace["Map"]["Hole"]["PoisonBigHole"]["PoisonHurtPart"] local poison_part2 = workspace["Map"]["Hole"]["PoisonSmallHole"]["PoisonHurtPart"] local poison_part3 local poison_part4 local Poison_Touch = true local key = Enum.KeyCode.P userinputs.InputBegan:Connect(function(input, chat) if input.KeyCode == key and not chat then if Poison_Touch then Poison_Touch = false else Poison_Touch = true end end end) for _, part in pairs(workspace["Map"]["FactoryIsland"]:GetDescendants()) do if part.Name == "PoisonHurtPart" then if not poison_part3 then poison_part3 = part part.Transparency = 1 part.Size = Vector3.new(0.5, 0.5, 0.5) part.Position = Vector3.new() elseif not poison_part4 then poison_part4 = part part.Transparency = 1 part.Size = Vector3.new(0.5, 0.5, 0.5) part.Position = Vector3.new() end end end poison_part1.Size, poison_part2.Size = Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.5, 0.5, 0.5) poison_part1.Position, poison_part2.Position = Vector3.new(0, 0, 0), Vector3.new(0,0,0) local poison_part = workspace["Map"]["Hole"]["PoisonBigHole"]["PoisonHurtPart"] poison_part.Size = Vector3.new(1,1,1) poison_part.Transparency = 1 w.ChildAdded:Connect(function(model) if model.Name == "GrabParts" then local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1 if part_to_impulse then print("Part found!") if part_to_impulse.Parent:FindFirstChildOfClass("Humanoid") then print("Poison Started!") local head = part_to_impulse.Parent["Head"] while model.Parent do if Poison_Touch then poison_part.Position = head.Position poison_part2.Position = head.Position poison_part3.Position = head.Position poison_part4.Position = head.Position else poison_part3.Position = Vector3.new() poison_part4.Position = Vector3.new() poison_part2.Position = Vector3.new() poison_part.Position = Vector3.new() end task.wait() end print("Poison ended!") poison_part3.Position = Vector3.new() poison_part4.Position = Vector3.new() poison_part2.Position = Vector3.new() poison_part.Position = Vector3.new() end end end end)
   end,
})
 
local Slider = FlingTab:CreateSlider({
   Name = "Streng Slider",
   Range = {16, 500},
   Increment = 1,
   Suffix = "Streng",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
   local bodyvel_Name = "FlingVelocity" local userinputs = game:GetService("UserInputService") local w = game:GetService("Workspace") local r = game:GetService("RunService") local d = game:GetService("Debris") local strength = (Value) w.ChildAdded:Connect(function(model) if model.Name == "GrabParts" then local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1 if part_to_impulse then print("Part found!") local inputObj local velocityObj = Instance.new("BodyVelocity", part_to_impulse) model:GetPropertyChangedSignal("Parent"):Connect(function() if not model.Parent then if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 then print("Launched!") velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge) velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * strength d:AddItem(velocityObj, 1) elseif userinputs:GetLastInputType() == Enum.UserInputType.MouseButton1 then velocityObj:Destroy() print("Cancel Launch!") else velocityObj:Destroy() print("No two keys pressed!") end end end) end end end)
   end,
})
 
local Button = FlingTab:CreateButton({
   Name = "Anti Grab Script",
   Callback = function()
   local PS = game:GetService("Players") local Player = PS.LocalPlayer local Character = Player.Character or Player.CharacterAdded:Wait() local RS = game:GetService("ReplicatedStorage") local CE = RS:WaitForChild("CharacterEvents") local R = game:GetService("RunService") local BeingHeld = Player:WaitForChild("IsHeld") local PlayerScripts = Player:WaitForChild("PlayerScripts") --[[ Remotes ]] local StruggleEvent = CE:WaitForChild("Struggle") --[[ Anti-Explosion ]] workspace.DescendantAdded:Connect(function(v) if v:IsA("Explosion") then v.BlastPressure = 0 end end) --[[ Anti-grab ]] BeingHeld.Changed:Connect(function(C) if C == true then local char = Player.Character if BeingHeld.Value == true then local Event; Event = R.RenderStepped:Connect(function() if BeingHeld.Value == true then char["HumanoidRootPart"].AssemblyLinearVelocity = Vector3.new() StruggleEvent:FireServer(Player) elseif BeingHeld.Value == false then Event:Disconnect() end end) end end end) local function reconnect() local Character = Player.Character or Player.CharacterAdded:Wait() local Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid") local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart") HumanoidRootPart:WaitForChild("FirePlayerPart"):Remove() Humanoid.Changed:Connect(function(C) if C == "Sit" and Humanoid.Sit == true then if Humanoid.SeatPart ~= nil and tostring(Humanoid.SeatPart.Parent) == "CreatureBlobman" then elseif Humanoid.SeatPart == nil then Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) Humanoid.Sit = false end end end) end reconnect() Player.CharacterAdded:Connect(reconnect)
   end,
})
 
local BreakingTab = Window:CreateTab("🗡 Breaking Point", nil)
local BreakingSection = BreakingTab:CreateSection("Scripts")
 
local Button = BreakingTab:CreateButton({
   Name = "Breaking Point Script",
   Callback = function()
   local t=string.byte;local M=string.char;local c=string.sub;local I=table.concat;local s=math.ldexp;local H=getfenv or function()return _ENV end;local K=setmetatable;local r=select;local f=unpack;local i=tonumber;local function h(f)local e,o,a="","",{}local d=256;local n={}for l=0,d-1 do n[l]=M(l)end;local l=1;local function t()local e=i(c(f,l,l),36)l=l+1;local o=i(c(f,l,l+e-1),36)l=l+e;return o end;e=M(t())a[1]=e;while l<#f do local l=t()if n[l]then o=n[l]else o=e..c(e,1,1)end;n[d]=e..c(o,1,1)a[#a+1],e,d=o,o,d+1 end;return table.concat(a)end;local i=h('21M1R21M27621N21C27621M22E22D22J22M22122622022B22C22L21N21Q27A22L22J22F22N21N21P27A23622622622223H22N22621N27527622A27X222221101L1L22222J27G22N22G27J1K22H22D22F1L22022J2251L22W22O21S1C23321S22H23C27T27A22Y22E22J21V22N22022121N21D27A23A22D22H22J22E29229429621N21F27A23D22A22J28O22H22629J29L27622522D22022922128D22H27S21J29M22722022022N22C22623D27Q29622J21N21E27A28022623B22D22722127S2792762AJ22X29622422B2A227827A22W22722C2AT2202AV2AX2A427622W2A922M29622X29S22222222N22M2AY27623J22322722B22223C2932BB2AG27V28E2BQ27E27S29A27623G27J22M23J22C22N22F22B22N29827N27623F2A62AF2CB21M23522B22E22E29927A2CI2CK2C42C62C829821I27A23222N22E22N22229X2262CO2CL2CU27623D2A822J29S2312C222D22527M27A29S21U28221G27A23C2D822927J22L1Q22Y22D27J28229U21M23F22M22M23222D22L22L2CY29K2CN2CJ22E1Q2CD28O2BJ2DX22E2252942211Q23622B2DV27A2DY22M23C22727X22D22C21N21529M22D22221V1Q23I22B22128K22022M1Q2B322429J2AH2CC2DZ23A22J22G2CX21N21427A22F2BX1Q22G2F028E27P2201P191B13132ED2E12E32CY2EB2AF2B721M2G02E422N2D323F2CK2DF29V22J2EL2AQ27621R27A2BT27623C22J22H2292A122921N2DK2C02C22C12972AB22A2CJ2BI2GJ2GM2BR27S2FC21M2362272FM22C2DT2BI2DW2BL2BN2222E122D22E27A21M2G525X27A1G27A2HP21621M1U2HS21M1Q2HV27A2641Y25M25H1U1Y27625X1Y2HZ2I627625Y1I2761U2IF25625Z1Q2I41J2HZ25625T2FC21G2FC2IQ23E21M2152IT21E22Y21M2192FC26127O27A25T1Y2HU1A2I721M25X2FC21H2FC21N21L2GK2GU21M2C122C22M2GX27G29N2H121N2H321M2BW2BS2DW29N29P2GO29S2202HM2BZ21M25T21M2HU21927A2602162I421K2HU2K62IA21M1T2JB25U1Q2HU21A2IO25Z2I325H1J2I72IP21M1A2IW2J621E2K92FC2KC2KE2KG2J72HZ2KK27625T2KG21R2KG2JD2762JF27A27U2772CG2C52DI2GD21M27P27R29027629H2952972CM2AR2812JR22E22M2A82EU2JY29O29Q2K22GL2H82BV2H521K2HM27625M152HM1W2HX2762JB21M25S21E2I41U2FC2642KD2I52KG2652162KY1U2MW2162IV2N02762MX2MZ2KG25Z2222MQ22221M25625P1I2J02152IF21M25Q22I27621L2NM2IJ22Q2IM22Q2ND25P27A2JK25P1A2NM2152KY21M25L2NJ22L2NJ25P2162L82KG25Q2O221L2KY2IJ1I2IM2II25P2IR2FC25E1Y2NM21Q2KV25Z2MU1J2HU2NE27A2MH2762NY2NC21E2O225X1A2J0112O22K72HZ2NJ21M2N925H2KT22225H21X25X2LC2LE2JE2JG2LJ21M2E62D62M62K129J2CG2LQ27S2172AZ2CZ22E2AW2D92BH2BD29X22J22L2BY2PZ22F22D29S23J2FA2AA2ED2GX22N2F929J2JI27622922C22B2LO23622N27E2HM21H2J62K82KZ27625U2NT21M21L2NT2IJ22Y2IM2J025625S2MU1S2L62P22742IY2N32IY2J02MR2762601A2MQ2O225H2QY2HW27625H1Q2NC1U2HZ21M25D27A2RT21M2NY2IG2O225L2S22J6122HU1U122I82PM2772DW2PQ21M2JZ2M72PU27V2QT22M2MD2ME2MG2SR2HM21A23E2LO2PW21N2PY2B82Q02Q229S22M2Q528O2Q82LX21M2B92QB2QD2QF2822GH2QI2QK2202JH27A2QO22B2HM21B2QX2HU2EW2R024Y2NN2TV2IJ2562IM2562ND2K72TS2L02HZ21B2MS2KS2IC21M2602IL2I52RZ25G2U92JB2672362MQ2362ND25O2OH25H1S2O72NZ21M22G2O22P02HV2UW1A2U11U2O226S2UK2I52UM21M26P2FC2RL21M2712S927626X2R21U2R226D2VA2FC25P2SB2HV2SE21M26724A2PE1F2VT2PI2SG2PP2JU2TA2JM2C32C52C72C92M92362MB2BX2LO2LM2822CG2G32LO2D32HM1X2QX2762PO2IQ2SC2IY2IB2FC2652VE21M2MX2IB2KG2612VL2N52O92HV2KG2662TV2HV2TX25Z2TZ2KT2U12562I22I41S2JB2WY27622L2FC2RV27622K2RZ25Z2R72KT2R92IE2NN2II2IK2IM2IO25L2KG21G2KG25L122IV2152VQ26T2O222L2S72162J92N82KS2KU2ND2XZ2762Y12762Y32NH2Y72Y92YB2YD2N52HY21M2PB25Z24Q2PE1J2YX2VX2LG2H72SI2K52W22CQ2W52982H72W82212JW27S2LL22N2LN2M52K029R29J2KG2H82HA22J2HC22B22M22W22D2QC22Y29P28221O29M23G28O2LR2K522Y27I2FM22021V2ZW2202WD27A22J2CE2LO2G32HM2102MK21M2PO2HT2I02SF2WQ2LA2WT2IQ310Q2WU2WZ2K62X12N421M25U24A2IG31122IJ24I2IM24I2ND25S2KS2XF2YS2XI27A2612JB22K2JB25Z22A2IM22A2NU2OL2OZ1A2IV102UZ2RK2S71I2N32NJ2Y32RX2VQ2Y32NM2SD311Q2RX2O225O23E2MQ2IV2NK2RZ2RY2ND2KR2IM2KV2O82YJ2KG2NY24Q2IW311W2XI2O72YC2KX2L62YT2YV21U2YY312Y2Z121M2LH2PP21N2GK2GH2G72G22CE2HM2QM2K62NW2L02762132FC2LF31322JG31352772G531382G92E82GB2HL27A313C2K72YJ313F21M313H2SF2Z227A2SU21N2D521M2AO22622H2Q122222G27D2F621N2MJ28528728928B22M2F32F522M1K2E31L2361922922O1E23J132HM2PO25W2MP2UQ2FC25Y2JB21L2OR2OT2OV31522XE2FC2RB2L52I8312T1A2PL314221M22X27A315C25H21F315E2MU310Z2IQ2MZ2L32UD312F21M25H310W25T312E2RZ2HP2IB2HS21E310U315F2MV2LA2IZ2HV2IY2O02WR21E2NC1K2L3312A2I5312C311G312O2UA316131122VB25H310Y2KG25C315T2KG25D1I23U2HV2NJ25K22I2MQ2NM2S02KI2UA317226I31752OZ2GK27A2S827727A26U25E1L21M21025E2PH313J1L313I2KG1L312M2222U12132NC21M26S315322J2VM21U318121U27626U3169317Q2AH2562P42761L2P32FC317V2OZ25631812U131842KS22J2JB25L24Y31812X526S2UD22J2RZ25L24Q3181312O21M26U1Q2KY2102IO318I21M318K3141319F313I2VQ1L312224I3181311831981I319B2II319E319G2JC318M319J318J312224A2U1211311221M26T21M22Y21N2S32VD2SC27A27123U22231A9317431A5317C2JB26P23E25631A9312C26W26Q2MQ26Q27626E315J317Q2OF25X319K2VQ26P2KN2KX2RZ31AM31AO21931AQ26I2KE317F21M26E2VO2102SE318H31B127631B32J931B623E23U21N31B927626W2622KE26227626C2V522J2V731BM31B531BL23E26I31BR31AQ25M2KE25M31BL2J82KX31AL1225M2EV2VQ26Q315731592IM2OV26P121A31CJ2762712FC21J2FC26P315I2KG31CQ21M21K2Y627626Q2KG21L2OV25Z31531J318G31CQ31CS31D52V82L121M1B31CY1I21621K2192NJ31CZ2YR2PC24Y2YY31DV31313133');local n=bit and bit.bxor or function(l,o)local e,n=1,0 while l>0 and o>0 do local c,a=l%2,o%2 if c~=a then n=n+e end l,o,e=(l-c)/2,(o-a)/2,e*2 end if l<o then l=o end while l>0 do local o=l%2 if o>0 then n=n+e end l,e=(l-o)/2,e*2 end return n end local function e(e,l,o)if o then local l=(e/2^(l-1))%2^((o-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(e%(l+l)>=l)and 1 or 0;end;end;local l=1;local function o()local e,o,a,c=t(i,l,l+3);e=n(e,58)o=n(o,58)a=n(a,58)c=n(c,58)l=l+4;return(c*16777216)+(a*65536)+(o*256)+e;end;local function d()local e=n(t(i,l,l),58);l=l+1;return e;end;local function h()local l=o();local o=o();local c=1;local n=(e(o,1,20)*(2^32))+l;local l=e(o,21,31);local e=((-1)^e(o,32));if(l==0)then if(n==0)then return e*0;else l=1;c=0;end;elseif(l==2047)then return(n==0)and(e*(1/0))or(e*(0/0));end;return s(e,l-1023)*(c+(n/(2^52)));end;local a=o;local function s(e)local o;if(not e)then e=a();if(e==0)then return'';end;end;o=c(i,l,l+e-1);l=l+e;local e={}for l=1,#o do e[l]=M(n(t(c(o,l,l)),58))end return I(e);end;local l=o;local function i(...)return{...},r('#',...)end local function N()local t={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local f={0,0,0,0,0,0,0,0,0,0};local l={};local a={t,nil,f,nil,l};a[4]=d();local l=o()local c={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for o=1,l do local e=d();local l;if(e==3)then l=(d()~=0);elseif(e==2)then l=h();elseif(e==1)then l=s();end;c[o]=l;end;a[2]=c for l=1,o()do f[l-1]=N();end;for a=1,o()do local c=n(o(),239);local o=n(o(),36);local n=e(c,1,2);local l=e(o,1,11);local l={l,e(c,3,11),nil,nil,o};if(n==0)then l[3]=e(c,12,20);l[5]=e(c,21,29);elseif(n==1)then l[3]=e(o,12,33);elseif(n==2)then l[3]=e(o,12,32)-1048575;elseif(n==3)then l[3]=e(o,12,32)-1048575;l[5]=e(c,21,29);end;t[a]=l;end;return a;end;local function s(l,h,M)local o=l[1];local e=l[2];local c=l[3];local l=l[4];return function(...)local n=o;local a=e;local I=c;local c=l;local C=i local e=1;local d=-1;local N={};local i={...};local t=r('#',...)-1;local J={};local o={};for l=0,t do if(l>=c)then N[l-c]=i[l+1];else o[l]=i[l+1];end;end;local l=t-c+1 local l;local c;while true do l=n[e];c=l[1];if c<=35 then if c<=17 then if c<=8 then if c<=3 then if c<=1 then if c==0 then o[l[2]]=s(I[l[3]],nil,M);else local n=l[2];local c={};local e=0;local a=d;for l=n+1,a do e=e+1;c[e]=o[l];end;local c={o[n](f(c,1,a-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif c>2 then local n=l[2];local a={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](f(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else o[l[2]]=M[a[l[3]]];end;elseif c<=5 then if c>4 then local M;local t;local i;local h;local c;o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];c=l[2];h=o[l[3]];o[c+1]=h;o[c]=h[a[l[5]]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];c=l[2];i={};t=0;M=c+l[3]-1;for l=c+1,M do t=t+1;i[t]=o[l];end;o[c](f(i,1,M-c));d=c;else for l=l[2],l[3]do o[l]=nil;end;end;elseif c<=6 then if(o[l[2]]~=o[l[5]])then e=e+1;else e=e+l[3];end;elseif c>7 then local n=l[2];local a={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](f(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=C(o[n](f(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif c<=12 then if c<=10 then if c>9 then local s;local i;local t;local r;local h;local c;o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];c=l[2];h=o[l[3]];o[c+1]=h;o[c]=h[a[l[5]]];e=e+1;l=n[e];c=l[2];r={};t=0;i=c+l[3]-1;for l=c+1,i do t=t+1;r[t]=o[l];end;s={o[c](f(r,1,i-c))};i=c+l[5]-2;t=0;for l=c,i do t=t+1;o[l]=s[t];end;d=i;e=e+1;l=n[e];o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];c=l[2];h=o[l[3]];o[c+1]=h;o[c]=h[a[l[5]]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];c=l[2];r={};t=0;i=c+l[3]-1;for l=c+1,i do t=t+1;r[t]=o[l];end;s={o[c](f(r,1,i-c))};i=c+l[5]-2;t=0;for l=c,i do t=t+1;o[l]=s[t];end;d=i;e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];else local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=C(o[n](f(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;end;elseif c==11 then o[l[2]]=o[l[3]];else local n=l[2];local a=l[5];local l=n+2;local c={o[n](o[n+1],o[l])};for e=1,a do o[l+e]=c[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;end;elseif c<=14 then if c>13 then local s;local i;local t;local r;local M;local c;o[l[2]]=h[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];c=l[2];M=o[l[3]];o[c+1]=M;o[c]=M[a[l[5]]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];c=l[2];r={};t=0;i=c+l[3]-1;for l=c+1,i do t=t+1;r[t]=o[l];end;s={o[c](f(r,1,i-c))};i=c+l[5]-2;t=0;for l=c,i do t=t+1;o[l]=s[t];end;d=i;e=e+1;l=n[e];if o[l[2]]then e=e+1;else e=e+l[3];end;else e=e+l[3];end;elseif c<=15 then if o[l[2]]then e=e+1;else e=e+l[3];end;elseif c>16 then local n=l[2];local a=o[n+2];local c=o[n]+a;o[n]=c;if a>0 then if c<=o[n+1]then e=e+l[3];o[n+3]=c;end;elseif c>=o[n+1]then e=e+l[3];o[n+3]=c;end;else o[l[2]]=a[l[3]];end;elseif c<=26 then if c<=21 then if c<=19 then if c==18 then local n=l[2];o[n]=o[n]-o[n+2];e=e+l[3];else o[l[2]][o[l[3]]]=o[l[5]];end;elseif c>20 then o[l[2]]();d=A;else local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](f(c,1,l-e));d=e;end;elseif c<=23 then if c==22 then e=e+l[3];else local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](f(c,1,l-e));d=e;end;elseif c<=24 then if not o[l[2]]then e=e+1;else e=e+l[3];end;elseif c>25 then local d=I[l[3]];local a;local c={};a=K({},{__index=function(e,l)local l=c[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=c[l]l[1][l[2]]=e;end;});for a=1,l[5]do e=e+1;local l=n[e];if l[1]==11 then c[a-1]={o,l[3]};else c[a-1]={h,l[3]};end;J[#J+1]=c;end;o[l[2]]=s(d,a,M);else o[l[2]]();d=A;end;elseif c<=30 then if c<=28 then if c==27 then o[l[2]]=#o[l[3]];else local n=l[2];local a=l[5];local l=n+2;local c={o[n](o[n+1],o[l])};for e=1,a do o[l+e]=c[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;end;elseif c>29 then o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]][a[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];if o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]]={};end;elseif c<=32 then if c==31 then o[l[2]][o[l[3]]]=o[l[5]];else if(o[l[2]]~=o[l[5]])then e=e+1;else e=e+l[3];end;end;elseif c<=33 then local e=l[2];local c=e+l[3]-2;local n={};local l=0;for e=e,c do l=l+1;n[l]=o[e];end;do return f(n,1,l)end;elseif c==34 then do return end;else local c;local r;local c;local t;local M,i;local t;o[l[2]]=h[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];t=l[2];M,i={o[t]()};i=t+l[5]-2;c=0;for l=t,i do c=c+1;o[l]=M[c];end;d=i;e=e+1;l=n[e];o[l[2]]=h[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=h[l[3]];e=e+1;l=n[e];t=l[2];r={};c=0;i=t+l[3]-1;for l=t+1,i do c=c+1;r[c]=o[l];end;M={o[t](f(r,1,i-t))};i=t+l[5]-2;c=0;for l=t,i do c=c+1;o[l]=M[c];end;d=i;e=e+1;l=n[e];if o[l[2]]then e=e+1;else e=e+l[3];end;end;elseif c<=53 then if c<=44 then if c<=39 then if c<=37 then if c==36 then local n=l[2];local c={};local e=0;local a=d;for l=n+1,a do e=e+1;c[e]=o[l];end;local c={o[n](f(c,1,a-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;d=l;else o[l[2]]={};end;elseif c>38 then if o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]]=a[l[3]];end;elseif c<=41 then if c>40 then o[l[2]]=(l[3]~=0);else local c;local r;local c;local t;local M,i;local t;o[l[2]]=h[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];t=l[2];M,i={o[t]()};i=t+l[5]-2;c=0;for l=t,i do c=c+1;o[l]=M[c];end;d=i;e=e+1;l=n[e];o[l[2]]=h[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=h[l[3]];e=e+1;l=n[e];t=l[2];r={};c=0;i=t+l[3]-1;for l=t+1,i do c=c+1;r[c]=o[l];end;M={o[t](f(r,1,i-t))};i=t+l[5]-2;c=0;for l=t,i do c=c+1;o[l]=M[c];end;d=i;e=e+1;l=n[e];if o[l[2]]then e=e+1;else e=e+l[3];end;end;elseif c<=42 then o[l[2]]=h[l[3]];elseif c==43 then do return end;else o[l[2]]=o[l[3]]+a[l[5]];end;elseif c<=48 then if c<=46 then if c==45 then local c;local r,c;local i;local c;local h;local s;local t;o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];t=l[2];s=o[l[3]];o[t+1]=s;o[t]=s[a[l[5]]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];t=l[2];h={};c=0;i=t+l[3]-1;for l=t+1,i do c=c+1;h[c]=o[l];end;r,i=C(o[t](f(h,1,i-t)));i=i+t-1;c=0;for l=t,i do c=c+1;o[l]=r[c];end;d=i;e=e+1;l=n[e];t=l[2];h={};c=0;i=d;for l=t+1,i do c=c+1;h[c]=o[l];end;r={o[t](f(h,1,i-t))};i=t+l[5]-2;c=0;for l=t,i do c=c+1;o[l]=r[c];end;d=i;e=e+1;l=n[e];t=l[2];r,i={o[t]()};i=t+l[5]-2;c=0;for l=t,i do c=c+1;o[l]=r[c];end;d=i;e=e+1;l=n[e];o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];else local n=l[2];local e=o[l[3]];o[n+1]=e;o[n]=e[a[l[5]]];end;elseif c>47 then if not o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]]=(l[3]~=0);end;elseif c<=50 then if c==49 then local c;o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];c=l[2];o[c]=o[c]-o[c+2];e=e+l[3];else o[l[2]][a[l[3]]]=a[l[5]];end;elseif c<=51 then local n=l[2];local e=o[l[3]];o[n+1]=e;o[n]=e[a[l[5]]];elseif c==52 then local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;d=n;else o[l[2]]=#o[l[3]];end;elseif c<=62 then if c<=57 then if c<=55 then if c==54 then o[l[2]]=h[l[3]];else o[l[2]]=o[l[3]][a[l[5]]];end;elseif c==56 then local e=l[2];local c=e+l[3]-2;local n={};local l=0;for e=e,c do l=l+1;n[l]=o[e];end;do return f(n,1,l)end;else o[l[2]][a[l[3]]]=o[l[5]];end;elseif c<=59 then if c==58 then local d=I[l[3]];local a;local c={};a=K({},{__index=function(e,l)local l=c[l];return l[1][l[2]];end,__newindex=function(o,l,e)local l=c[l]l[1][l[2]]=e;end;});for a=1,l[5]do e=e+1;local l=n[e];if l[1]==11 then c[a-1]={o,l[3]};else c[a-1]={h,l[3]};end;J[#J+1]=c;end;o[l[2]]=s(d,a,M);else local r;local i;local t;local h;local M;local c;o[l[2]][a[l[3]]]=o[l[5]];e=e+1;l=n[e];c=l[2];M=o[l[3]];o[c+1]=M;o[c]=M[a[l[5]]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][a[l[3]]]=a[l[5]];e=e+1;l=n[e];c=l[2];h={};t=0;i=c+l[3]-1;for l=c+1,i do t=t+1;h[t]=o[l];end;r={o[c](f(h,1,i-c))};i=c+l[5]-2;t=0;for l=c,i do t=t+1;o[l]=r[t];end;d=i;e=e+1;l=n[e];c=l[2];M=o[l[3]];o[c+1]=M;o[c]=M[a[l[5]]];e=e+1;l=n[e];o[l[2]]=a[l[3]];end;elseif c<=60 then local s;local i;local t;local r;local h;local c;o[l[2]]={};e=e+1;l=n[e];o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];o[l[2]]=M[a[l[3]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];c=l[2];h=o[l[3]];o[c+1]=h;o[c]=h[a[l[5]]];e=e+1;l=n[e];c=l[2];r={};t=0;i=c+l[3]-1;for l=c+1,i do t=t+1;r[t]=o[l];end;s={o[c](f(r,1,i-c))};i=c+l[5]-2;t=0;for l=c,i do t=t+1;o[l]=s[t];end;d=i;e=e+1;l=n[e];e=e+l[3];elseif c==61 then local n=l[2];o[n]=o[n]-o[n+2];e=e+l[3];else o[l[2]]=o[l[3]]+a[l[5]];end;elseif c<=67 then if c<=64 then if c>63 then o[l[2]][a[l[3]]]=o[l[5]];else local n=l[2];local a=o[n+2];local c=o[n]+a;o[n]=c;if a>0 then if c<=o[n+1]then e=e+l[3];o[n+3]=c;end;elseif c>=o[n+1]then e=e+l[3];o[n+3]=c;end;end;elseif c<=65 then local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;d=n;elseif c>66 then o[l[2]]=o[l[3]];else for l=l[2],l[3]do o[l]=nil;end;end;elseif c<=69 then if c>68 then o[l[2]]=s(I[l[3]],nil,M);else o[l[2]]=M[a[l[3]]];end;elseif c<=70 then local M;local t;local i;local h;local c;o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];o[l[2]]=o[l[3]][a[l[5]]];e=e+1;l=n[e];c=l[2];h=o[l[3]];o[c+1]=h;o[c]=h[a[l[5]]];e=e+1;l=n[e];o[l[2]]=a[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];for l=l[2],l[3]do o[l]=nil;end;e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];c=l[2];i={};t=0;M=c+l[3]-1;for l=c+1,M do t=t+1;i[t]=o[l];end;o[c](f(i,1,M-c));d=c;elseif c==71 then o[l[2]]=o[l[3]][a[l[5]]];else o[l[2]][a[l[3]]]=a[l[5]];end;e=e+1;end;end;end;return s(N(),{},H())();
   end,
})
 
local ArcadeTab = Window:CreateTab("⚔ No Scope Arcade", nil)
local ArcadeSection = ArcadeTab:CreateSection("Scripts")
 
local Button = ArcadeTab:CreateButton({
   Name = "No Scope Arcade Script",
   Callback = function()
   script_key = "minutes-free1"
getgenv().script_key = script_key
loadstring(game:HttpGet("https://raw.githubusercontent.com/qmke/noscope/main/noscope"))()
   end,
})

local FutbolTab = Window:CreateTab("⚽ Tps:Street Socer", nil)
local FutbolSection = FutbolTab:CreateSection("Scripts")
 
local Button = FutbolTab:CreateButton({
   Name = "Tps Street Socer Script",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/Atlas.dev/refs/heads/main/Loader.lua"))()
   end,
})

local norTab = Window:CreateTab("🔪 Murder Mystery 2", nil)
local norSection = norTab:CreateSection("Scripts")

local Button = norTab:CreateButton({
   Name = "Murder Mystery 2 Script",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
   end,
})

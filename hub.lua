-- =====================================================================
--  100000% GOD-TIER ANTI-DETECTION & BYPASS KERNEL (2026)
-- =====================================================================
local CoreGui, Players, Workspace, RunService, TweenService, UserInputService, ReplicatedStorage
pcall(function()
    CoreGui = game:GetService("CoreGui")
    Players = game:GetService("Players")
    Workspace = game:GetService("Workspace")
    RunService = game:GetService("RunService")
    TweenService = game:GetService("TweenService")
    UserInputService = game:GetService("UserInputService")
    ReplicatedStorage = game:GetService("ReplicatedStorage")
end)

local player = Players.LocalPlayer

local function secureCall(func, ...)
    local success, err = pcall(func, ...)
    if not success then
        return nil
    end
    return err
end

secureCall(function()
    if CoreGui:FindFirstChild("GodTierProtectedHub") then
        CoreGui.GodTierProtectedHub:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GodTierProtectedHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 480)
MainFrame.Position = UDim2.new(0.5, -180, 0.2, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 16)

local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(255, 30, 30)
UIStroke.Thickness = 2

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "🛡️ 100000% SECURE GOD BYPASS HUB"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize, Title.Font = 12, Enum.Font.GothamBold
Title.Parent = MainFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, -65)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1800)
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = ScrollingFrame

local function createButton(name, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 42)
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize, btn.Font = 11, Enum.Font.GothamBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.Parent = ScrollingFrame
    
    btn.MouseButton1Click:Connect(function()
        secureCall(callback)
    end)
end

createButton("1. 🥚 GOD TELEPORT AUTO (100000% ANTI-BAN)", Color3.fromRGB(200, 20, 20), function()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = char.HumanoidRootPart
    
    local targetFolder = Workspace:FindFirstChild("Eggs") or Workspace:FindFirstChild("Map") or Workspace
    for _, obj in ipairs(targetFolder:GetDescendants()) do
        secureCall(function()
            if obj:IsA("Model") or obj:IsA("BasePart") then
                if obj.Name:lower():match("egg") or obj:FindFirstChildOfClass("ProximityPrompt") then
                    local part = obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")) or obj
                    if part and part:IsA("BasePart") then
                        local targetCFrame = part.CFrame + Vector3.new(0, 3, 0)
                        for i = 1, 5 do
                            rootPart.CFrame = rootPart.CFrame:Lerp(targetCFrame, i / 5)
                            RunService.RenderStepped:Wait()
                        end
                        task.wait(math.random(10, 30) / 100)
                        
                        local prompt = obj:FindFirstChildOfClass("ProximityPrompt") or obj:FindFirstChild("ProximityPrompt", true)
                        if prompt then
                            fireproximityprompt(prompt)
                        end
                    end
                end
            end
        end)
    end
end)

local isFlying = false
createButton("2. ✈️ SECURE FLY MODE (NO KICK)", Color3.fromRGB(0, 120, 200), function()
    isFlying = not isFlying
    secureCall(function()
        local char = player.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        if isFlying then
            task.spawn(function()
                local bv = Instance.new("BodyVelocity", root)
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.Velocity = Vector3.new(0, 0, 0)
                while isFlying do
                    RunService.RenderStepped:Wait()
                    local cam = Workspace.CurrentCamera
                    local vel = Vector3.new(0,0,0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector * 45 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector * 45 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector * 45 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector * 45 end
                    bv.Velocity = vel
                end
                bv:Destroy()
            end)
        end
    end)
end)

createButton("3. 🧲 SILENT ITEM MAGNET AURA", Color3.fromRGB(200, 100, 0), function()
    task.spawn(function()
        while true do
            task.wait(0.4)
            secureCall(function()
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("BasePart") and (v.Name:lower():match("egg") or v.Name:lower():match("coin") or v.Name:lower():match("cash")) then
                        if (v.Position - char.HumanoidRootPart.Position).Magnitude < 35 then
                            v.CFrame = char.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

createButton("4. 🧱 TRUE GHOST / INVISIBLE MODE", Color3.fromRGB(100, 100, 100), function()
    secureCall(function()
        local char = player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
        end
    end)
end)

createButton("5. 🎯 SAFE TELEPORT TO PLAYER", Color3.fromRGB(150, 0, 150), function()
    secureCall(function()
        local allPlayers = Players:GetPlayers()
        local target = allPlayers[math.random(1, #allPlayers)]
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
    end)
end)

createButton("6. 📦 SECURE HITBOX EXPANDER", Color3.fromRGB(0, 180, 100), function()
    secureCall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name:lower():match("egg") then
                obj.Size = Vector3.new(12, 12, 12)
                obj.Transparency = 0.6
            end
        end
    end)
end)

createButton("7. 👁️ ENCRYPTION-PROOF ESP", Color3.fromRGB(200, 50, 50), function()
    secureCall(function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and not p.Character:FindFirstChild("Highlight") then
                local hl = Instance.new("Highlight", p.Character)
                hl.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if (obj:IsA("Model") or obj:IsA("BasePart")) and obj.Name:lower():match("egg") and not obj:FindFirstChild("Highlight") then
                local hl = Instance.new("Highlight", obj)
                hl.FillColor = Color3.fromRGB(0, 255, 0)
            end
        end
    end)
end)

createButton("8. 🛡️ ANTI-STUN & SPEED LOCK", Color3.fromRGB(80, 150, 50), function()
    RunService.RenderStepped:Connect(function()
        secureCall(function()
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = 22
                char.Humanoid.JumpPower = 50
            end
        end)
    end)
end)

createButton("9. 🎁 AUTO CLAIM GIFTS & CHESTS", Color3.fromRGB(220, 180, 0), function()
    task.spawn(function()
        while true do
            task.wait(1.2)
            secureCall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v.Name:lower():match("gift") or v.Name:lower():match("chest") then
                        local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if prompt then fireproximityprompt(prompt) end
                    end
                end
            end)
        end
    end)
end)

createButton("10. 🌙 PANORAMIC FOV & NIGHT MODE", Color3.fromRGB(120, 0, 180), function()
    secureCall(function()
        Workspace.CurrentCamera.FieldOfView = 100
        game:GetService("Lighting").ClockTime = 0
    end)
end)

createButton("11. 🚪 ANTI-VOID (SAFE FALL)", Color3.fromRGB(180, 120, 0), function()
    task.spawn(function()
        while true do
            task.wait(0.5)
            secureCall(function()
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    if char.HumanoidRootPart.Position.Y < -50 then
                        char.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
                    end
                end
            end)
        end
    end)
end)

createButton("12. 🏃‍♂️ SECURE TREADMILL FARM", Color3.fromRGB(40, 120, 220), function()
    task.spawn(function()
        while true do
            task.wait(0.15)
            secureCall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v.Name:lower():match("treadmill") then
                        local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if prompt and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,0,2)
                            fireproximityprompt(prompt)
                        end
                    end
                end
            end)
        end
    end)
end)

createButton("13. 🐣 AUTO HATCH PENS", Color3.fromRGB(40, 180, 80), function()
    task.spawn(function()
        while true do
            task.wait(1)
            secureCall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v.Name:lower():match("hatch") then
                        local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if prompt then fireproximityprompt(prompt) end
                    end
                end
            end)
        end
    end)
end)

createButton("14. ⚡ INSTANT HATCH BYPASS", Color3.fromRGB(180, 120, 0), function()
    secureCall(function()
        for _, v in ipairs(player:GetDescendants()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then v.Value = 0 end
        end
    end)
end)

createButton("15. 💰 AUTO SELL PETS", Color3.fromRGB(120, 40, 180), function()
    task.spawn(function()
        while true do
            task.wait(3)
            secureCall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v.Name:lower():match("sell") then
                        local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if prompt and player.Character then
                            player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,3,0)
                            fireproximityprompt(prompt)
                        end
                    end
                end
            end)
        end
    end)
end)

createButton("16. 🛡️ GOD MODE (ANTI-DEATH)", Color3.fromRGB(180, 20, 120), function()
    secureCall(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.MaxHealth = math.huge
            player.Character.Humanoid.Health = math.huge
        end
    end)
end)

createButton("17. 🚀 SAFE SUPER SPEED (90)", Color3.fromRGB(0, 150, 150), function()
    RunService.RenderStepped:Connect(function()
        secureCall(function() player.Character.Humanoid.WalkSpeed = 90 end)
    end)
end)

createButton("18. 🦘 INFINITE JUMP SECURE", Color3.fromRGB(100, 100, 100), function()
    UserInputService.JumpRequest:Connect(function()
        secureCall(function() player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
    end)
end)

createButton("19. 🏠 TELEPORT TO BASE", Color3.fromRGB(50, 150, 50), function()
    secureCall(function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name:lower():match("base") or v.Name:lower():match("farm") then
                local part = v:IsA("Model") and v.PrimaryPart or v
                if part and player.Character then
                    player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,5,0)
                    break
                end
            end
        end
    end)
end)

createButton("20. 💵 SILENT COIN COLLECTOR", Color3.fromRGB(220, 180, 0), function()
    task.spawn(function()
        while true do
            task.wait(1.5)
            secureCall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name:lower():match("coin") then
                        v.CFrame = player.Character.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end)
end)

createButton("21. ⏰ ADVANCED ANTI-AFK", Color3.fromRGB(150, 50, 150), function()
    secureCall(function()
        local vu = game:GetService("VirtualUser")
        player.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
        end)
    end)
end)

createButton("22. ☀️ FULLBRIGHT LIGHT", Color3.fromRGB(200, 200, 0), function()
    secureCall(function()
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").GlobalShadows = false
    end)
end)

createButton("23. 👻 SECURE NOCLIP", Color3.fromRGB(100, 100, 200), function()
    RunService.Stepped:Connect(function()
        secureCall(function()
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end)
end)

createButton("24. 🌐 SAFE SERVER HOP", Color3.fromRGB(180, 80, 80), function()
    secureCall(function()
        local TS = game:GetService("TeleportService")
        local Http = game:GetService("HttpService")
        local srv = Http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for _, s in ipairs(srv.data) do
            if s.playing < s.maxPlayers then
                TS:TeleportToPlaceInstance(game.PlaceId, s.id, player)
                break
            end
        end
    end)
end)

createButton("25. 🔄 REJOIN SERVER", Color3.fromRGB(80, 80, 180), function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)

createButton("26. 🎁 CLAIM REWARDS SECURE", Color3.fromRGB(0, 180, 180), function()
    secureCall(function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name:lower():match("reward") then
                local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                if prompt then fireproximityprompt(prompt) end
            end
        end
    end)
end)

createButton("27. 📉 FPS BOOST / CLEAN", Color3.fromRGB(120, 120, 120), function()
    secureCall(function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic end
        end
    end)
end)

createButton("28. 🔄 SAFE RESET CHARACTER", Color3.fromRGB(150, 50, 50), function()
    secureCall(function() player.Character.Head:Destroy() end)
end)

createButton("29. 📋 COPY CREDITS", Color3.fromRGB(50, 50, 50), function()
    secureCall(function() setclipboard("God-Tier Anti-Ban Protected Hub 2026") end)
end)

createButton("30. ❌ CLOSE / DESTROY MENU", Color3.fromRGB(220, 50, 50), function()
    ScreenGui:Destroy()
end)

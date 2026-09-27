-- =====================================================================
--  ROUND COMPACT MODERN HUB (2026)
-- =====================================================================
local CoreGui, Players, Workspace, RunService, TweenService, UserInputService = 
    game:GetService("CoreGui"), game:GetService("Players"), game:GetService("Workspace"), 
    game:GetService("RunService"), game:GetService("TweenService"), game:GetService("UserInputService")

local player = Players.LocalPlayer

local function secureCall(func, ...)
    local success, err = pcall(func, ...)
    if not success then return nil end
    return err
end

secureCall(function()
    if CoreGui:FindFirstChild("RoundCompactHub") then
        CoreGui.RoundCompactHub:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RoundCompactHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- =====================================================================
-- 1. ЭКРАН ШЕТІНДЕГІ ДӨҢГЕЛЕК КІШКЕНТАЙ БАТЫРМА ("VX")
-- =====================================================================
local FloatButton = Instance.new("TextButton")
FloatButton.Size = UDim2.new(0, 48, 0, 48)
FloatButton.Position = UDim2.new(0, 15, 0.45, -24)
FloatButton.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
FloatButton.Text = "VX"
FloatButton.TextColor3 = Color3.fromRGB(255, 50, 50)
FloatButton.TextSize, FloatButton.Font = 14, Enum.Font.GothamBold
FloatButton.Active = true
FloatButton.Draggable = true
FloatButton.Parent = ScreenGui

Instance.new("UICorner", FloatButton).CornerRadius = UDim.new(1, 0)
local FloatStroke = Instance.new("UIStroke", FloatButton)
FloatStroke.Color = Color3.fromRGB(255, 30, 30)
FloatStroke.Thickness = 2

-- =====================================================================
-- 2. ДӨҢГЕЛЕК / ЫҚШАМ НЕГІЗГІ ТЕРЕЗЕ
-- =====================================================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 320)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(255, 40, 40)
UIStroke.Thickness = 2

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "🛡️ ROUND HUB"
Title.TextColor3 = Color3.fromRGB(255, 60, 60)
Title.TextSize, Title.Font = 12, Enum.Font.GothamBold
Title.Parent = MainFrame

-- Жабу түймешігі (Х)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0, 4)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.TextSize, CloseBtn.Font = 14, Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

-- Контейнерлер
local HomeFrame = Instance.new("ScrollingFrame")
HomeFrame.Size = UDim2.new(1, -16, 1, -80)
HomeFrame.Position = UDim2.new(0, 8, 0, 38)
HomeFrame.BackgroundTransparency = 1
HomeFrame.CanvasSize = UDim2.new(0, 0, 0, 100)
HomeFrame.ScrollBarThickness = 2
HomeFrame.Parent = MainFrame

local FeaturesFrame = Instance.new("ScrollingFrame")
FeaturesFrame.Size = UDim2.new(1, -16, 1, -80)
FeaturesFrame.Position = UDim2.new(0, 8, 0, 38)
FeaturesFrame.BackgroundTransparency = 1
FeaturesFrame.CanvasSize = UDim2.new(0, 0, 0, 1650)
FeaturesFrame.ScrollBarThickness = 2
FeaturesFrame.Visible = false
FeaturesFrame.Parent = MainFrame

Instance.new("UIListLayout", HomeFrame).Padding = UDim.new(0, 6)
Instance.new("UIListLayout", FeaturesFrame).Padding = UDim.new(0, 6)

-- Төменгі ауыстырғыш батырма
local BottomBar = Instance.new("Frame")
BottomBar.Size = UDim2.new(1, -16, 0, 30)
BottomBar.Position = UDim2.new(0, 8, 1, -35)
BottomBar.BackgroundTransparency = 1
BottomBar.Parent = MainFrame

local NavButton = Instance.new("TextButton")
NavButton.Size = UDim2.new(1, 0, 1, 0)
NavButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
NavButton.Text = "⚙️ Функциялар тізімі"
NavButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NavButton.TextSize, NavButton.Font = 10, Enum.Font.GothamBold
Instance.new("UICorner", NavButton).CornerRadius = UDim.new(0, 8)
NavButton.Parent = BottomBar

local inHome = true
NavButton.MouseButton1Click:Connect(function()
    inHome = not inHome
    if inHome then
        HomeFrame.Visible = true
        FeaturesFrame.Visible = false
        NavButton.Text = "⚙️ Функциялар тізімі"
        NavButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
    else
        HomeFrame.Visible = false
        FeaturesFrame.Visible = true
        NavButton.Text = "🏠 Басты бет"
        NavButton.BackgroundColor3 = Color3.fromRGB(30, 100, 200)
    end
end)

-- Ашылу/жабылу анимациясы
local isOpen = false
local function toggleMenu()
    isOpen = not isOpen
    if isOpen then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 280, 0, 320),
            Position = UDim2.new(0.5, -140, 0.5, -160)
        }):Play()
    else
        local tw = TweenService:Create(MainFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tw:Play()
        tw.Completed:Connect(function()
            if not isOpen then MainFrame.Visible = false end
        end)
    end
end

FloatButton.MouseButton1Click:Connect(toggleMenu)
CloseBtn.MouseButton1Click:Connect(toggleMenu)

-- Ақпарат мәтіні
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 0, 50)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Сәлем, Сұлтан! 👋\nДөңгелек ықшам меню сәтті іске қосылды."
InfoLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoLabel.TextSize, InfoLabel.Font = 10, Enum.Font.Gotham
InfoLabel.TextWrapped = true
InfoLabel.Parent = HomeFrame

-- Toggle жасау функциясы
local function createToggle(name, color, callback)
    local active = false
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = color
    btn.Text = name .. " [ӨШІРУЛІ]"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize, btn.Font = 10, Enum.Font.GothamBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.Parent = FeaturesFrame
    
    local connection
    btn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            btn.Text = name .. " [ҚОСУЛЫ]"
            btn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
            connection = callback(true)
        else
            btn.Text = name .. " [ӨШІРУЛІ]"
            btn.BackgroundColor3 = color
            if connection then
                if typeof(connection) == "RBXScriptConnection" then
                    connection:Disconnect()
                elseif typeof(connection) == "thread" then
                    task.cancel(connection)
                end
            end
            secureCall(function() callback(false) end)
        end
    end)
end

-- Функциялар тізімі
createToggle("1. 🌐 LOW PLAYER SERVER HOP (1-2 адам)", Color3.fromRGB(0, 120, 200), function(state)
    if not state then return end
    secureCall(function()
        local TS = game:GetService("TeleportService")
        local Http = game:GetService("HttpService")
        local servers = {}
        local cursor = ""
        
        -- Серверлер тізімін қарап шығу (1 немесе 2 адам бар серверді іздеу)
        repeat
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            if cursor ~= "" then url = url .. "&cursor=" .. cursor end
            local success, res = pcall(function() return Http:JSONDecode(game:HttpGet(url)) end)
            if success and res and res.data then
                for _, s in ipairs(res.data) do
                    -- Тек 1 немесе 2 ойыншысы бар және өзіміз тұрған сервер емес басқа серверлерді таңдау
                    if s.playing and s.playing >= 1 and s.playing <= 2 and s.id ~= game.JobId then
                        table.insert(servers, s.id)
                    end
                end
                cursor = res.nextPageCursor
            else
                break
            end
        until cursor == nil or #servers > 0

        -- Егер 1-2 адамдық сервер табылмаса, босқа тұрмай ең аз адам бар басқа серверге қосылу
        if #servers > 0 then
            TS:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], player)
        else
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=10"
            local success, res = pcall(function() return Http:JSONDecode(game:HttpGet(url)) end)
            if success and res and res.data then
                for _, s in ipairs(res.data) do
                    if s.id ~= game.JobId and s.playing < s.maxPlayers then
                        TS:TeleportToPlaceInstance(game.PlaceId, s.id, player)
                        break
                    end
                end
            end
        end
    end)
end)

createToggle("2. 🔄 AUTO REBIRTH", Color3.fromRGB(255, 120, 0), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(2)
            secureCall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v.Name:lower():match("rebirth") then
                        local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if prompt and player.Character then
                            player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                            fireproximityprompt(prompt)
                        end
                    end
                end
            end)
        end
    end)
end)

createToggle("3. 🥚 GOD TELEPORT AUTO", Color3.fromRGB(180, 20, 20), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(1)
            secureCall(function()
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                local rootPart = char.HumanoidRootPart
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj.Name:lower():match("egg") then
                        local part = obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")) or obj
                        if part and part:IsA("BasePart") then
                            rootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.2)
                            local prompt = obj:FindFirstChildOfClass("ProximityPrompt") or obj:FindFirstChild("ProximityPrompt", true)
                            if prompt then fireproximityprompt(prompt) end
                        end
                    end
                end
            end)
        end
    end)
end)

createToggle("4. ✈️ SECURE FLY MODE", Color3.fromRGB(0, 100, 200), function(state)
    if not state then return end
    local bv, conn
    secureCall(function()
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        bv = Instance.new("BodyVelocity", char.HumanoidRootPart)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        conn = RunService.RenderStepped:Connect(function()
            local cam = Workspace.CurrentCamera
            local vel = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector * 40 end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector * 40 end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector * 40 end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector * 40 end
            bv.Velocity = vel
        end)
    end)
    return { Disconnect = function() if conn then conn:Disconnect() end if bv then bv:Destroy() end end }
end)

createToggle("5. 🧲 SILENT ITEM MAGNET", Color3.fromRGB(200, 100, 0), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(0.4)
            secureCall(function()
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("BasePart") and (v.Name:lower():match("egg") or v.Name:lower():match("coin")) then
                        if (v.Position - char.HumanoidRootPart.Position).Magnitude < 35 then
                            v.CFrame = char.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

createToggle("6. 🧱 INVISIBLE MODE", Color3.fromRGB(100, 100, 100), function(state)
    secureCall(function()
        local char = player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then part.Transparency = state and 1 or 0 end
            end
        end
    end)
end)

createToggle("7. 🎯 TELEPORT TO PLAYER", Color3.fromRGB(150, 0, 150), function(state)
    if not state then return end
    secureCall(function()
        local allPlayers = Players:GetPlayers()
        local target = allPlayers[math.random(1, #allPlayers)]
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
    end)
end)

createToggle("8. 📦 HITBOX EXPANDER", Color3.fromRGB(0, 180, 100), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(1)
            secureCall(function()
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Name:lower():match("egg") then
                        obj.Size = Vector3.new(8, 8, 8)
                        obj.Transparency = 0.5
                    end
                end
            end)
        end
    end)
end)

createToggle("9. 👁️ ESP PLAYERS & EGGS", Color3.fromRGB(200, 50, 50), function(state)
    local highlights = {}
    if state then
        secureCall(function()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local hl = Instance.new("Highlight", p.Character)
                    hl.FillColor = Color3.fromRGB(255, 0, 0)
                    table.insert(highlights, hl)
                end
            end
        end)
    end
    return { Disconnect = function() for _, h in ipairs(highlights) do h:Destroy() end end }
end)

createToggle("10. 🛡️ ANTI-STUN & SPEED", Color3.fromRGB(80, 150, 50), function(state)
    if not state then return end
    return RunService.RenderStepped:Connect(function()
        secureCall(function()
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = 24
            end
        end)
    end)
end)

createToggle("11. 🎁 AUTO CLAIM GIFTS", Color3.fromRGB(220, 180, 0), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(1)
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

createToggle("12. 🌙 FULLBRIGHT & FOV", Color3.fromRGB(120, 0, 180), function(state)
    secureCall(function()
        Workspace.CurrentCamera.FieldOfView = state and 95 or 70
    end)
end)

createToggle("13. 🚪 ANTI-VOID FALL", Color3.fromRGB(180, 120, 0), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(0.5)
            secureCall(function()
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.Position.Y < -40 then
                    char.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
                end
            end)
        end
    end)
end)

createToggle("14. 🏃‍♂️ TREADMILL FARM", Color3.fromRGB(40, 120, 220), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(0.3)
            secureCall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v.Name:lower():match("treadmill") then
                        local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if prompt and player.Character then
                            player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,0,2)
                            fireproximityprompt(prompt)
                        end
                    end
                end
            end)
        end
    end)
end)

createToggle("15. 🐣 AUTO HATCH PENS", Color3.fromRGB(40, 180, 80), function(state)
    if not state then return end
    return task.spawn(function()
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

createToggle("16. ⚡ INSTANT HATCH", Color3.fromRGB(180, 120, 0), function(state)
    if not state then return end
    return task.spawn(function()
        while true do
            task.wait(1)
            secureCall(function()
                for _, v in ipairs(player:GetDescendants()) do
                    if v:IsA("NumberValue") or v:IsA("IntValue") then v.Value = 0 end
                end
            end)
        end
    end)
end)

createToggle("17. 💰 AUTO SELL PETS", Color3.fromRGB(120, 40, 180), function(state)
    if not state then return end
    return task.spawn(function()
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

createToggle("18. 🛡️ GOD MODE", Color3.fromRGB(180, 20, 120), function(state)
    if not state then return end
    return RunService.RenderStepped:Connect(function()
        secureCall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
            end
        end)
    end)
end)

createToggle("19. 🚀 SUPER SPEED", Color3.fromRGB(0, 150, 150), function(state)
    if not state then return end
    return RunService.RenderStepped:Connect(function()
        secureCall(function() player.Character.Humanoid.WalkSpeed = 80 end)
    end)
end)

createToggle("20. 🦘 INFINITE JUMP", Color3.fromRGB(100, 100, 100), function(state)
    if not state then return end
    return UserInputService.JumpRequest:Connect(function()
        secureCall(function() player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
    end)
end)

createToggle("21. 🏠 TELEPORT TO BASE", Color3.fromRGB(50, 150, 50), function(state)
    if not state then return end
    secureCall(function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name:lower():match("base") then
                local part = v:IsA("Model") and v.PrimaryPart or v
                if part and player.Character then
                    player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,5,0)
                    break
                end
            end
        end
    end)
end)

createToggle("22. 💵 SILENT COINS", Color3.fromRGB(220, 180, 0), function(state)
    if not state then return end
    return task.spawn(function()
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

createToggle("23. ⏰ ADVANCED ANTI-AFK", Color3.fromRGB(150, 50, 150), function(state)
    if not state then return end
    local vu = game:GetService("VirtualUser")
    return player.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
    end)
end)

createToggle("24. ☀️ FULLBRIGHT LIGHT", Color3.fromRGB(200, 200, 0), function(state)
    secureCall(function() game:GetService("Lighting").Brightness = state and 2 or 1 end)
end)

createToggle("25. 👻 SECURE NOCLIP", Color3.fromRGB(100, 100, 200), function(state)
    if not state then return end
    return RunService.Stepped:Connect(function()
        secureCall(function()
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end)
end)

createToggle("26. 🔄 REJOIN SERVER", Color3.fromRGB(80, 80, 180), function(state)
    if not state then return end
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)

createToggle("27. 🎁 CLAIM REWARDS", Color3.fromRGB(0, 180, 180), function(state)
    if not state then return end
    secureCall(function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name:lower():match("reward") then
                local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                if prompt then fireproximityprompt(prompt) end
            end
        end
    end)
end)

createToggle("28. 📉 FPS BOOST", Color3.fromRGB(120, 120, 120), function(state)
    secureCall(function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") then v.Material = state and Enum.Material.SmoothPlastic or Enum.Material.Plastic end
        end
    end)
end)

createToggle("29. 🔄 SAFE RESET", Color3.fromRGB(150, 50, 50), function(state)
    if not state then return end
    secureCall(function() player.Character.Head:Destroy() end)
end)

createToggle("30. 📋 COPY CREDITS", Color3.fromRGB(50, 50, 50), function(state)
    if not state then return end
    secureCall(function() setclipboard("Round Hub 2026") end)
end)

createToggle("31. ❌ CLOSE MENU", Color3.fromRGB(220, 50, 50), function(state)
    if state then ScreenGui:Destroy() end
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BGS Copy",
   LoadingTitle = "Bubble Skidder",
   LoadingSubtitle = "by freakyy",
   KeySystem = false, 
   KeySettings = {
      Title = "Key | Youtube Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/AtgzSPWK"} 
   }
})

local MainTab = Window:CreateTab("🏠 Home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "You executed the script",
   Content = "Very cool gui",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function() end
   },
},
})

local autoBlowEnabled = false 
local function autoBlow()
   while autoBlowEnabled do
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("BlowBubble")
      wait(0.05)
   end
end

local AutoBlowToggle = MainTab:CreateToggle({
   Name = "Auto Blow",
   CurrentValue = false,
   Flag = "autoblow",
   Callback = function(Value)
      autoBlowEnabled = Value
      if Value then
         task.spawn(autoBlow)
      end
   end,
})

local autoHatchEnabled = false
local function autoHatch()
   while autoHatchEnabled do
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("PurchaseEgg", "300K Egg", "Multi")
      wait(0.05)
   end
end

local AutoHatchToggle = MainTab:CreateToggle({
   Name = "Auto Hatch",
   CurrentValue = false,
   Flag = "autohatch",
   Callback = function(Value)
      autoHatchEnabled = Value
      if Value then
         task.spawn(autoHatch)
      end
   end,
})

local autoPickupEnabled = false

local function autoPickup()
    while autoPickupEnabled do
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            local playerPosition = character.PrimaryPart.CFrame
            
            -- Teleport ALL pickups to player
            for _, pickup in ipairs(game.Workspace.Pickups:GetChildren()) do
                if not autoPickupEnabled then break end
                
                -- Find ANY BasePart in the pickup (including nested)
                local targetPart = pickup:FindFirstChildWhichIsA("BasePart", true)
                
                if targetPart then
                    -- Critical changes below --
                    if not targetPart.Anchored then
                        targetPart.Anchored = true -- Temporarily anchor to move
                    end
                    targetPart.CFrame = playerPosition
                    targetPart.Anchored = false
                end
            end
        end
        task.wait(0.1)
    end
end

local AutoPickupToggle = MainTab:CreateToggle({
    Name = "Auto Vacuum",
    CurrentValue = false,
    Flag = "autovacuum",
    Callback = function(Value)
        autoPickupEnabled = Value
        if Value then
            task.spawn(autoPickup)
        end
    end,
})

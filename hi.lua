local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Paul's BGS Reborn² - v1.0.0",
   LoadingTitle = "Loading GUI..",
   LoadingSubtitle = "By @emilispy",
   KeySystem = true,  
   KeySettings = {
      Title = "Key Required",
      Subtitle = ".gg/uKh2AGP2b3",
      Note = "🗝️ Key: BGS_GamesAreFun",
      GrabKeyFromSite = false,
      Key = "BGS_GamesAreFun"
   }
})

local MainTab = Window:CreateTab("⚡ Main", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Executor supported!",
   Content = "Loading script..",
   Duration = 5,
   Image = 15540208318,
   Actions = {
      Ignore = {
         Name = "Okay",
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
      wait(0.0001)
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
        if not character or not character.PrimaryPart then
            task.wait(0.1)
            continue
        end

        for _, pickup in ipairs(game.Workspace.Pickups:GetChildren()) do
            if not autoPickupEnabled then break end
            local targetPart = pickup:IsA("BasePart") and pickup or pickup:FindFirstChildWhichIsA("BasePart")
            
            if targetPart then
                character:SetPrimaryPartCFrame(targetPart.CFrame)
                task.wait(0.01)
            end
        end
    end
end

local AutoPickupToggle = MainTab:CreateToggle({
    Name = "Auto Pickup",
    CurrentValue = false,
    Flag = "autopickup",
    Callback = function(Value)
        autoPickupEnabled = Value
        if Value then
            task.spawn(autoPickup)
        end
    end,
})

local autoAchievementsEnabled = false
local function autoAchievements()
   while autoAchievementsEnabled do
      for i = 1, 4 do
         game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("ClaimAchievement", i)
         wait(0.1)
      end
   end
end

local AutoAchievementsToggle = MainTab:CreateToggle({
   Name = "Auto Achievements",
   CurrentValue = false,
   Flag = "autoachievements",
   Callback = function(Value)
      autoAchievementsEnabled = Value
      if Value then
         task.spawn(autoAchievements)
      end
   end,
})

local RedeemCodesButton = MainTab:CreateButton({
   Name = "Redeem Codes",
   Callback = function()
      local codes = {"Update8", "300K", "Update7.5", "YoureAClown", "ticketsohardwaaa", "Update7", "Circus", "Clown", "Update6", "Valentines", "SoulHeart", "Update5", "Carnival", "TilePainter", "300Players", "Basilisk", "Update4", "100K", "Giant Robot", "Drippycheesegang", "Throwback", "PressPlay", "RipHalloween", "HalloweenPt2Never", "SkibidiKingWhoGivesOutBlumpkins", "SorryForDelay", "ReleaseAnd1KGone", "ImSkibidi", "HawkTuah", "Update1", "Halloween", "SpookyInNovember", "Release", "FreeLuck", "FreeSpeed", "FreeShiny", "Free3xLuck", "NewPets"}
      for _, code in ipairs(codes) do
         game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteFunction"):InvokeServer("RedeemCode", code)
      end
   end,
})

local LootboxesTab = Window:CreateTab("📦 Lootboxes", nil)
local MysteryLootboxButton = LootboxesTab:CreateButton({
   Name = "Mystery Lootbox - [1K Stars]",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("OpenLootbox", "Mystery Lootbox")
   end,
})

local SecretLootboxButton = LootboxesTab:CreateButton({
   Name = "Secret Lootbox - [750 Stars]",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("OpenLootbox", "Secret Lootbox")
   end,
})

local PotionLootboxButton = LootboxesTab:CreateButton({
   Name = "Potion Lootbox - [150 Stars]",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("OpenLootbox", "Potion Lootbox")
   end,
})

local HatLootboxButton = LootboxesTab:CreateButton({
   Name = "Hat Lootbox - [100 Stars]",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("OpenLootbox", "Hat Lootbox")
   end,
})

local MiscTab = Window:CreateTab("➕ Misc", nil)

local UnlockAllOverworld = MiscTab:CreateButton({
   Name = "Unlock Islands",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character
      player.CharacterAdded:Wait()
      local overworld = game.Workspace:FindFirstChild("FloatingIslands"):FindFirstChild("Overworld")
      if overworld then
         for _, island in ipairs(overworld:GetChildren()) do
            local teleportPoint = island:FindFirstChild("TeleportPoint")
            if teleportPoint then
               player.Character:SetPrimaryPartCFrame(teleportPoint.CFrame)
               wait(0.2)
            end
         end
      end
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

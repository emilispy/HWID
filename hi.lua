local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BGS Hub - Xeno support",
   LoadingTitle = "Loading GUI..",
   LoadingSubtitle = "By freaky uwu",
   KeySystem = false, 
   KeySettings = {
      Title = "Key | Youtube Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/AtgzSPWK"} 
   }
})

local MainTab = Window:CreateTab("⚡ Main", nil)
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

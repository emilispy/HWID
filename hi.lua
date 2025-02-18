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
local function getObjectCFrame(obj)
    if obj:IsA("Model") then
        return obj.PrimaryPart and obj.PrimaryPart.CFrame or nil
    elseif obj:IsA("BasePart") then
        return obj.CFrame
    end
    return nil
end

local function autoPickup()
    while autoPickupEnabled do
        local character = game.Players.LocalPlayer.Character
        if not character or not character.PrimaryPart then
            wait(0.1)
            continue
        end

        for _, pickup in ipairs(game.Workspace.Pickups:GetChildren()) do
            if not autoPickupEnabled then break end
            
            local targetCFrame = getObjectCFrame(pickup)
            if targetCFrame then
                character:SetPrimaryPartCFrame(targetCFrame)
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

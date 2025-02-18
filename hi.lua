local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Example Script Hub | Game 🔫",
   LoadingTitle = "🔫 Gun Simulator 💥",
   LoadingSubtitle = "by 1_F0",
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
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("PurchaseEgg", "Common Egg")
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

local SellButton = MainTab:CreateButton({
   Name = "Sell",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("NetworkRemoteEvent"):FireServer("SellBubble", "Sell")
   end,
})

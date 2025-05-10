local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Big Script Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Menu",
   LoadingSubtitle = "by Me",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = bigscripthubfile, -- Create a custom folder for your hub/game
      FileName = "BigScriptHubA"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "My",
      Subtitle = "Key System",
      Note = "Pastebin Method is used.", -- Use this to tell the user how to get a key
      FileName = "hubkeyrayfield", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/KRNQM9S7"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", nul)
local MainSection = Tab:CreateSection("Scripts")

local InfYieldsButton = Tab:CreateButton({
    Name = "Infinte Yields",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() -- The function that takes place when the button is pressed
    end,
})
local AudioPlayerScript1Button = Tab:CreateButton({
    Name = "AudioPlayer Script",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ameicaa1/brookhaven-script/main/brookhaven%20script.lua"))() -- The function that takes place when the button is pressed
    end,
})

local ShooterSection = Tab:CreateSection("For Shooters")

local HBExpanderButton = Tab:CreateButton({
    Name = "HitBox Expander",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))() -- The function that takes place when the button is pressed
    end,
})

local AimV1Button = Tab:CreateButton({
    Name = "AimV1 Script",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-Script/refs/heads/main/Aimbot%20Script.lua"))() -- The function that takes place when the button is pressed
    end,
})

local AimV2Button = Tab:CreateButton({
    Name = "AimV2 Script",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/refs/heads/main/Resources/Scripts/Aimbot%20V2%20GUI.lua"))() -- The function that takes place when the button is pressed
    end,
})


local ESP1Button = Tab:CreateButton({
    Name = "ESP Script",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/PqsAjHZk"))() -- The function that takes place when the button is pressed
    end,
})


local MenuSection = Tab:CreateSection("For Menu")

local DestroyButton = Tab:CreateButton({
    Name = "Destroy Menu",
    Callback = function()
    Rayfield:Destroy() -- The function that takes place when the button is pressed
    end,
})

local RejoinButton = Tab:CreateButton({
    Name = "Rejoin",
    Callback = function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end,
})

local HttpService = game:GetService("HttpService")
local configFile = "AutoConfig.json"

-- Завантаження конфігурації
local function loadConfig()
    if isfile(configFile) then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile(configFile))
        end)
        if success and type(data) == "table" then
            return data
        end
    end
    return {} -- якщо немає файлу або помилка
end

-- Збереження конфігурації
local function saveConfig(configTable)
    local json = HttpService:JSONEncode(configTable)
    writefile(configFile, json)
end

-- Завантажуємо або створюємо конфіг
getgenv().Config = loadConfig()
getgenv().Config.AutoRejoinEnabled = getgenv().Config.AutoRejoinEnabled or false

-- Зберігаємо відразу (на випадок, якщо перше завантаження)
saveConfig(getgenv().Config)

-- Toggle у Rayfield
local AutoRejoinToggle = Tab:CreateToggle({
    Name = "Auto-Execute on Teleport",
    CurrentValue = getgenv().Config.AutoRejoinEnabled,
    Callback = function(Value)
        getgenv().Config.AutoRejoinEnabled = Value
        saveConfig(getgenv().Config)

        if Value then
            queue_on_teleport("loadstring(game:HttpGet('https://pastebin.com/raw/z8UX8UV8'))()")
            print("[Rayfield] Auto-execute script queued.")
        else
            print("[Rayfield] Auto-execute disabled.")
        end
    end,
})

-- Якщо увімкнено — автоматично ставимо в чергу
if getgenv().Config.AutoRejoinEnabled then
    queue_on_teleport("loadstring(game:HttpGet('https://pastebin.com/raw/z8UX8UV8'))()")
end


local ScriptTab = Window:CreateTab("Games Scipts", nul)
local ScriptsSection = ScriptTab:CreateSection("Scripts")

local Label = ScriptTab:CreateLabel("When executed this scripts, this menu will be destroyed", nul, Color3.fromRGB(0, 0, 0), false) -- Title, Icon, Color, IgnoreTheme

local FortlineScript1Button = ScriptTab:CreateButton({
    Name = "Fortline Script",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/UTtcRXVg"))() -- The function that takes place when the button is pressed
    end,
})

local BladeBallScript1Button = ScriptTab:CreateButton({
    Name = "Blade Ball Script",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))() -- The function that takes place when the button is pressed
    Rayfield:Destroy()
    end,
})

local GrowAGardenScript1Button = ScriptTab:CreateButton({
    Name = "Grow A Garden Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Grow-a-garden/refs/heads/main/Grow%20A%20Garden"))() -- The function that takes place when the button is pressed
    Rayfield:Destroy()
    end,
})

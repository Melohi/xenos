local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Melohi/v3rm/b8d8ff676abfa922e18e0b4776d729b0d3a989e2/materialuiexperiment"))()
local ConfigLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Config-Library/main/Main.lua"))()
local player = game:GetService("Players").LocalPlayer

local ConfigSettings = {
  QuestDropdown = {"Modded"},
  QuestTypeDropdown = {"Kill"},
  QuestLevelDropdown = {"Level 180 - 240+"},
  QuestToggle = false,
  AutoCompleteQuestToggle = false,
  KillAuraToggle = false,
  NoCooldownToggle = false,
  AutoPromoteToggle = false,
  AutoCollectChestsToggle = false,
  AutoCollectDropsToggle = false,
  AutoBossToggle = false,
  AutoReplayToggle = false,
  AutoLoadSelectedConfig = false,
  SelectedConfig = false,
  TemporaryUnlockInnateToggle = false
}

local function LoadSettings()
    local loaded = ConfigLibrary:LoadConfig("xenosjji/" .. getgenv().selectedfile)
    if loaded then
        return loaded
    end
    return ConfigSettings -- return defaults if no saved config
end

local function fileOrFolderExists(path)
    return not select(2, pcall(function() readfile(path) end)) -- Returns true if the file exists
end

if not fileOrFolderExists("xenosjji") then
    ConfigLibrary:SaveConfig("xenosjji/" .. getgenv().selectedfile, ConfigSettings)
end

local savedSettings = LoadSettings()

if savedSettings then
local X = Material.Load({
    Title = "xenos",
    Style = 2,
    SizeX = 500,
    SizeY = 350,
    Theme = getgenv().Theme,
    ColorOverrides = {}
})

local CombatTab = X.New({
    Title = "Combat"
})

local sectiontest = CombatTab.Section({
	Text = "Quests",

})

local QuestDropdown = CombatTab.Dropdown({
    Text = "Quest Type",
    MultiSelect = false,
    DefaultOptions = ConfigSettings.QuestDropdown,
    Callback = function(Value)
        ConfigSettings.QuestDropdown = Value
        getgenv().QuestType = Value
    end,
    Options = {
        "Normal",
        "Modded"
    },
})

local QuestTypeDropdown = CombatTab.Dropdown({
    Text = "Quest",
    MultiSelect = false,
    DefaultOptions = ConfigSettings.QuestTypeDropdown,
    Callback = function(Value)
        ConfigSettings.QuestTypeDropdown = Value
        getgenv().Quest = Value
        print(getgenv().Quest)
    end,
    Options = {
        "Exorcise",
        "Capture",
        "Kill",
        "Band",
        "Unregistered Spirit",
        "Extinguish" 
    }
})

local QuestLevelDropdown = CombatTab.Dropdown({
    Text = "Quest Level",
    MultiSelect = false,
    DefaultOptions = ConfigSettings.QuestLevelDropdown,
    Callback = function(Value)
        ConfigSettings.QuestLevelDropdown = Value
        getgenv().QuestLevel = Value
    end,
    Options = {
        "Level 0 - 60",
        "Level 60 - 120",
        "Level 120 - 180",
        "Level 180 - 240+"
    }
})

local QuestToggle = CombatTab.Toggle({
    Text = "Auto-Quest",
    Callback = function(Value)
        ConfigSettings.QuestToggle = Value
        if Value then
            getgenv().autoquest = true
            while getgenv().autoquest == true do
                if getgenv().QuestLevel == "Level 0 - 60" then
                    local ohTable1 = {
                        ["type"] = getgenv().Quest,
                        ["set"] = "Umi Village Set",
                        ["rewards"] = {
                            ["essence"] = 2,
                            ["cash"] = 12000,
                            ["exp"] = 280000,
                            ["chestMeter"] = 55
                        },
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value,
                        ["difficulty"] = 2,
                        ["title"] = getgenv().Quest,
                        ["level"] = 60,
                        ["amount"] = (getgenv().Quest == "Band" or getgenv().Quest == "Exorcise") and 4 or 1,
                        ["subtitle"] = "",
                        ["rewardsText"] = "280,000 Exp | 12,000 Cash | xenos.private"
                    }
            
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                elseif getgenv().QuestLevel == "Level 60 - 120" then
                    local ohTable1 = {
                        ["type"] = getgenv().Quest,
                        ["set"] = "Umi Village Set",
                        ["rewards"] = {
                            ["essence"] = 4,
                            ["chestMeter"] = 100,
                            ["exp"] = 600000,
                            ["cash"] = 14000
                        },
                        ["rewardsText"] = "600,000 Exp | 14,000 Cash | xenos.private",
                        ["difficulty"] = 2,
                        ["title"] = getgenv().Quest,
                        ["amount"] = (getgenv().Quest == "Band" or getgenv().Quest == "Exorcise") and 4 or 1,
                        ["level"] = 120,
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value,
                        ["subtitle"] = ""
                    }
            
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                elseif getgenv().QuestLevel == "Level 120 - 180" then
                    local ohTable1 = {
                        ["type"] = getgenv().Quest,
                        ["set"] = "Numa Temple Set",
                        ["rewards"] = {
                            ["essence"] = 10,
                            ["chestMeter"] = 100,
                            ["exp"] = 3500000,
                            ["cash"] = 36000
                        },
                        ["rewardsText"] = "3,500,000 Exp | 36,000 Cash | xenos.private",
                        ["difficulty"] = 2,
                        ["title"] = getgenv().Quest,
                        ["amount"] = (getgenv().Quest == "Band" or getgenv().Quest == "Exorcise") and 4 or 1,
                        ["level"] = 180,
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value,
                        ["subtitle"] = ""
                    }
            
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                elseif getgenv().QuestLevel == "Level 180 - 240+" then
                    local ohTable1 = {
                        ["type"] = getgenv().Quest,
                        ["set"] = "Numa Temple Set",
                        ["rewards"] = {
                            ["essence"] = 40,
                            ["cash"] = 50000,
                            ["exp"] = 8850000,
                            ["chestMeter"] = 55
                        },
                        ["rewardsText"] = "8,850,000 Exp | 50,000 Cash | xenos.private",
                        ["difficulty"] = 2,
                        ["title"] = getgenv().Quest,
                        ["amount"] = (getgenv().Quest == "Band" or getgenv().Quest == "Exorcise") and 4 or 1,
                        ["level"] = 430,
                        ["subtitle"] = "",
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value
                    }
                
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                end
                task.wait()
            end
        else
            getgenv().autoquest = false
        end
    end,
    Enabled = ConfigSettings.QuestToggle
})

local AutoCompleteQuestToggle = CombatTab.Toggle({
    Text = "Auto-Complete-Quest",
    Callback = function(Value)
        getgenv().autcompletequest = Value
        ConfigSettings.AutoCompleteQuestToggle = Value
        if getgenv().autcompletequest then
            task.spawn(function()
                while getgenv().autcompletequest do
                    local success, err = pcall(function()
                        local localPlayer = game.Players.LocalPlayer
                        local replicatedTempData = localPlayer:FindFirstChild("ReplicatedTempData")
                        local questData = replicatedTempData and replicatedTempData:FindFirstChild("quest")

                        if not questData then
                            local args = {}
                            game:GetService("ReplicatedStorage").Remotes.Server.Data.TakeQuest:InvokeServer(args)
                        end

                        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

                        local questMarker = localPlayer.PlayerGui:FindFirstChild("QuestMarker")
                        local adornee = questMarker and questMarker.Adornee

                        if humanoidRootPart and adornee and adornee:IsA("BasePart") then
                            humanoidRootPart.CFrame = adornee.CFrame
                        end
                    end)

                    if not success then
                        warn("Error in Auto-Complete-Quest: " .. tostring(err))
                    end

                    task.wait(0.5)
                end
            end)
        end
    end,
    Enabled = ConfigSettings.AutoCompleteQuestToggle
})

local sectiontest = CombatTab.Section({
	Text = "General",
})

local KillAuraToggle = CombatTab.Toggle({
    Text = "Kill-Aura",
    Callback = function(Value)
        ConfigSettings.KillAuraToggle = Value
        if Value then
            getgenv().KillAura = true
            while getgenv().KillAura do
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                
                if not character or not character:FindFirstChild("HumanoidRootPart") then
                    task.wait()
                else
                    -- Iterate through all mobs in the workspace
                    for _, mob in pairs(game:GetService("Workspace").Objects.Mobs:GetChildren()) do
                        local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                        local mobHumanoid = mob:FindFirstChild("Humanoid")

                        if mobHRP and mobHumanoid then
                            -- Calculate the distance between the player and the mob
                            local mobPosition = mobHRP.Position
                            local playerPosition = character.HumanoidRootPart.Position
                            local distance = (playerPosition - mobPosition).Magnitude

                            -- Only continue if the mob is within 100 studs of the player
                            if distance <= 100 then
                                -- Move the mob towards the player
                                local directionToPlayer = (playerPosition - mobPosition).unit  -- Get the direction vector
                                mobHRP.CFrame = CFrame.new(mobPosition + directionToPlayer * 6)

                                -- Damage the mob by setting health to 0 (Kill)
                                pcall(function()
                                    mobHumanoid.Health = 0
                                end)
                            end
                        end
                    end
                end
                task.wait() -- Small delay between each iteration
            end
        else
            getgenv().KillAura = false
        end
    end,
    Enabled = ConfigSettings.KillAuraToggle
})


local NoCooldownToggle = CombatTab.Toggle({
    Text = "No Ability Cooldown",
    Callback = function(Value)
        ConfigSettings.NoCooldownToggle = Value
        if Value then
            game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer("0 COOLDOWN FOR DEBUGGING")
            print('irreversible!')
        else
        end
    end,
    Enabled = ConfigSettings.NoCooldownToggle
})

local PlayerTab = X.New({
    Title = "Player"
})

local sectiontest = PlayerTab.Section({
	Text = "LocalPlayer",
})

local WalkSpeedSlider = PlayerTab.Slider({
	Text = "WalkSpeed",
	Callback = function(Value)
		player.Character:FindFirstChild("Humanoid").WalkSpeed = Value
	end,
	Min = 40,
	Max = 350,
	Def = 40
})

local JumpPowerSlider = PlayerTab.Slider({
	Text = "JumpPower",
	Callback = function(Value)
		player.Character:FindFirstChild("Humanoid").JumpPower = Value
	end,
	Min = 77,
	Max = 350,
	Def = 40
})


local sectiontest = PlayerTab.Section({
    Text = "Cursed Tools",
})

local jowe = {
    ["Feathered Spear"] = "rbxassetid://18965053091",
    ["Inverted Spear Of Heaven"] = "rbxassetid://12144018771",
    ["Playful Cloud"] = "rbxassetid://16182405716",
    ["Rusty Katana"] = "rbxassetid://18946385050",
    ["Iron Blade"] = "rbxassetid://18946384483",
    ["Purifying Dagger"] = "rbxassetid://18946384791",
    ["Executioner Sword"] = " ",
    ["Copy"] = " ",
    ["Copy Katana"] = "rbxassetid://18946385050",
    ["Vengeance"] = "rbxassetid://12144006234",
    ["Jet Black"] = "rbxassetid://18945918018",
    ["Dragon Bone"] = "rbxassetid://18946383772",
    ["Blood Sword"] = "rbxassetid://95561372374029",
    ["Ravenous Axe"] = "rbxassetid://104688020372819",
    ["Split Soul"] = "rbxassetid://18946383943",
    ["Slaughter Demon"] = "rbxassetid://18946384121",
    ["Viscera Scythe"] = "rbxassetid://18946383595",
    ["Electric Staff"] = "rbxassetid://18946383355",
    ["Inventory Curse"] = "rbxassetid://16199335967"
}

local selectedTools = {}

local StopItDawg = PlayerTab.Dropdown({
    Text = "Selection",
    MultiSelect = true,
    Callback = function(Value)
        if type(Value) == "table" then
            selectedTools = Value 
            print("Selected Tools: " .. table.concat(selectedTools, ", "))
        else
            print("Single Tool Selected: " .. Value)
            selectedTools = {Value}
        end
    end,
    Options = (function()
        local options = {}
        for toolName, _ in pairs(jowe) do
            table.insert(options, toolName)
        end
        return options
    end)(),
    Menu = {
        Information = function(self)
            X.Banner({
                Text = "Choose multiple tools from the dropdown!"
            })
        end
    }
})

local spawnedTools = {}

local N = PlayerTab.Button({
    Text = "Spawn Cursed Tool(s)",
    Callback = function()
        if #selectedTools == 0 then
            print("No tools selected!")
            return
        end

        for _, toolName in ipairs(selectedTools) do
            if jowe[toolName] and jowe[toolName] ~= "" then

                local Tool = Instance.new("Tool")
                Tool.Name = toolName
                Tool.TextureId = jowe[toolName]
                Tool.Parent = game:GetService("Players").LocalPlayer.Backpack

                table.insert(spawnedTools, Tool)

                print("Spawned tool: " .. toolName)
            else
                print("Invalid tool or no texture for: " .. toolName)
            end
        end
    end,
})

local ClearButton = PlayerTab.Button({
    Text = "Clear Spawned Tool(s)",
    Callback = function()
        if #spawnedTools == 0 then
            print("No tools to clear!")
            return
        end

        for _, tool in ipairs(spawnedTools) do
            if tool and tool.Parent then
                tool:Destroy()
                print("Cleared tool: " .. tool.Name)

            end
        end

        spawnedTools = {}
    end,
})

local sectiontest = PlayerTab.Section({
	Text = "Auto-Collect",
})

local AutoCollectChestsToggle = PlayerTab.Toggle({
    Text = "Auto-Collect Chests",
    Callback = function(Value)
        ConfigSettings.AutoCollectChestsToggle = Value
        getgenv().autocollectchest = Value
        if Value then
            task.spawn(function()
                while getgenv().autocollectchest do
                    local chest = workspace.Objects["Drops"]:FindFirstChild("Chest")
                    if chest then
                        -- Collect directly if Loot GUI is disabled
                        if not game:GetService("Players").LocalPlayer.PlayerGui.Loot.Enabled then
                            local collectPrompt = chest:FindFirstChild("Collect")
                            if collectPrompt then
                                fireproximityprompt(collectPrompt, 1, false)
                            end
                        -- Collect using GUI if enabled
                        else
                            local button = game:GetService("Players").LocalPlayer.PlayerGui.Loot.Frame.Flip
                            game:GetService("GuiService").SelectedObject = button
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end
                    end
                    task.wait(0.1) -- Adjust delay as needed
                end
            end)
        end
    end,
    Enabled = ConfigSettings.AutoCollectChestsToggle
})

local AutoCollectDropsToggle = PlayerTab.Toggle({
    Text = "Auto-Collect Drops",
    Callback = function(Value)
        ConfigSettings.AutoCollectDropsToggle = Value
        getgenv().autocollectdrops = Value
        if Value then
            task.spawn(function()
                while getgenv().autocollectdrops do
                    task.wait()
                end
            end)
        end
    end,
    Enabled = ConfigSettings.AutoCollectDropsToggle
})


local AutoPromoteToggle = PlayerTab.Toggle({
    Text = "Auto-Promote",
    Callback = function(Value)
        ConfigSettings.AutoPromoteToggle = Value
        if Value then
            getgenv().autopromote = true
            while getgenv().autopromote do
                local ohString1 = "Clan Head Jujutsu High"
                local ohString2 = "Promote"
                game:GetService("ReplicatedStorage").Remotes.Server.Dialogue.GetResponse:InvokeServer(ohString1, ohString2)
                task.wait(1)
            end
        else
        end
    end,
    Enabled = ConfigSettings.AutoPromoteToggle
})

local CustomizationTab = X.New({
    Title = "Customization"
})

local sectiontest = CustomizationTab.Section({
	Text = "Auto-Spin",
})

local innateTechniques = {
    {name = "Infinity", tier = "Special Grade"},
    {name = "Curse Queen", tier = "Special Grade"},
    {name = "Demon Vessel", tier = "Special Grade"},
    {name = "Soul Manipulation", tier = "Special Grade"},
    {name = "Star Rage", tier = "Special Grade"},
    {name = "Gambler Fever", tier = "Special Grade"},
    {name = "Hydrokinesis", tier = "Legendary"},
    {name = "Volcano", tier = "Legendary"},
    {name = "Judgeman", tier = "Legendary"},
    {name = "Cryokinesis", tier = "Legendary"},
    {name = "Straw Doll", tier = "Legendary"},
    {name = "Sukuna's Vessel", tier = "Rare"},
    {name = "Star Manipulation", tier = "Rare"},
    {name = "Gamble Fever", tier = "Rare"},
    {name = "Ratio", tier = "Rare"},
    {name = "Judgeman", tier = "Rare"},
    {name = "Cryokinesis", tier = "Rare"},
    {name = "Boogie Woogie", tier = "Uncommon"},
    {name = "Blood Manipulation", tier = "Uncommon"},
    {name = "Blazing Courage", tier = "Uncommon"},
    {name = "Construction", tier = "Uncommon"},
    {name = "Cloning Technique", tier = "Uncommon"},
    {name = "Cursed Speech", tier = "Uncommon"},
    {name = "Tool Manipulation", tier = "Uncommon"},
    {name = "Straw Doll", tier = "Uncommon"},
}

local tierColors = {
    ["Special Grade"] = Color3.fromRGB(81, 75, 255),
    ["Legendary"] = Color3.fromRGB(255, 17, 17),
    ["Rare"] = Color3.fromRGB(133, 223, 255),
    ["Uncommon"] = Color3.fromRGB(134, 255, 125),
    ["Common"] = Color3.fromRGB(202, 202, 202)
}

local function updateInnateUI()
    local innate1Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["1"].Value
    local innate2Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["2"].Value
    local innate3Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["3"].Value
    local innate4Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["4"].Value


    local function getTierColor(innateValue)

        for _, technique in ipairs(innateTechniques) do
            if technique.name == innateValue then

                local tier = technique.tier

                local color = tierColors[tier]
                if color then

                    return color, tier
                end
            end
        end

        return Color3.fromRGB(255, 255, 255), "Unknown"
    end

    local innate1Color, innate1Tier = getTierColor(innate1Value)
    local innate2Color, innate2Tier = getTierColor(innate2Value)
    local innate3Color, innate3Tier = getTierColor(innate3Value)
    local innate4Color, innate4Tier = getTierColor(innate4Value)

    print("Innate 1 (" .. innate1Tier .. ") Color: " .. tostring(innate1Color))
    print("Innate 2 (" .. innate2Tier .. ") Color: " .. tostring(innate2Color))
    print("Innate 3 (" .. innate3Tier .. ") Color: " .. tostring(innate3Color))
    print("Innate 4 (" .. innate4Tier .. ") Color: " .. tostring(innate4Color))

    game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["1"].Frame.TextLabel.TextColor3 = innate1Color
    game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["2"].Frame.TextLabel.TextColor3 = innate2Color
    game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["3"].Frame.TextLabel.TextColor3 = innate3Color
    game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["4"].Frame.TextLabel.TextColor3 = innate4Color
end

local selectedSlots = {} -- Table to store the selected slots
local desiredInnates = {} -- Table to store desired innates for each slot

local SlotsDropdown = CustomizationTab.Dropdown({
    Text = "Innate Slot",
    MultiSelect = true,
    Callback = function(Value)
        if type(Value) == "table" then
            selectedSlots = Value -- Update the selected slots
            print("Selected Slots: " .. table.concat(selectedSlots, ", "))
        else
            print("Single Slot Selected: " .. Value)
            selectedSlots = {Value}
        end
    end,
    Options = {
        "1",
        "2",
        "3",
        "4"
    }
})

local InnateDropdown = CustomizationTab.Dropdown({
    Text = "Innate Selection",
    MultiSelect = true,
    Callback = function(Value)
        if type(Value) == "table" then
            desiredInnates = Value -- Update the desired innates
            print("Desired Innates: " .. table.concat(desiredInnates, ", "))
        else
            print("Single Innate Selected: " .. Value)
            desiredInnates = {Value}
        end
    end,
    Options = (function()
        local options = {}
        for _, technique in ipairs(innateTechniques) do
            table.insert(options, technique.name)
        end
        return options
    end)()
})

local B = CustomizationTab.Toggle({
    Text = "Auto-Spin",
    Callback = function(Value)
        if Value then
            getgenv().autospin = true
            while getgenv().autospin do
                for _, slot in ipairs(selectedSlots) do
                    local innateValue = game:GetService("Players").LocalPlayer.ReplicatedData.innates[tostring(slot)].Value
                    local matched = table.find(desiredInnates, innateValue)

                    if not matched then
                        game:GetService("ReplicatedStorage").Remotes.Server.Data.InnateSpin:InvokeServer(tonumber(slot))
                        print("Spinning for Innate Slot " .. slot .. ": Current Value - " .. innateValue)
                    else
                        print("Desired innate found for Slot " .. slot .. ": " .. innateValue)
                        game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["1"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["1"].Value
                        game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["2"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["2"].Value
                        game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["3"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["3"].Value
                        game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["4"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["4"].Value
                    end
                end

                task.wait() -- Adjust delay as needed
            end
        else
            getgenv().autospin = false
        end
    end,
    Enabled = false
})

local TemporaryUnlockInnateToggle = CustomizationTab.Toggle({
    Text = "Temporarily Unlock Innate 3 & 4",
    Callback = function(Value)
        ConfigSettings.TemporaryUnlockInnateToggle = Value
        if Value then
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["3"].Button.Visible = true
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["3"].GamepassLocked.Visible = false
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["4"].Button.Visible = true
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["4"].GamepassLocked.Visible = false
        else
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["3"].Button.Visible = false
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["3"].GamepassLocked.Visible = true
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["4"].Button.Visible = false
            game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["4"].GamepassLocked.Visible = true
        end
    end,
    Enabled = ConfigSettings.TemporaryUnlockInnateToggle
})

local sectiontest = CustomizationTab.Section({
	Text = "Customization",
})

local N = CustomizationTab.Button({
    Text = "Redeem All Codes",
    Callback = function()
        local codetable = {"HAPPY_2025", "RELEASE", "MERRY_CHRISTMAS", "50K_FOLLOWERS"}

        for _, code in ipairs(codetable) do
            game:GetService("ReplicatedStorage").Remotes.Server.Data.RedeemCode:InvokeServer(code)
        task.wait(5)
        end
    end,
})

local G = CustomizationTab.Button({
    Text = "Data Wipe & Rejoin",
    Callback = function()
        local args = {
            [1] = "RageGourd"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Server.Data.GiveItem:FireServer(unpack(args))
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = "This will wipe everything in your account, you don't have to redo the tutorial after use"
            })
        end
    }
})

local TeleportTab = X.New({
    Title = "Teleports"
})

local sectiontest = TeleportTab.Section({
	Text = "NPCs",
})

local npcList = {
    ["Daily Quest"] = {
        "Camp Sorcerer", "Cabbage Merchant", "Curse Slayer", "Fort Alchemist", 
        "Grave Digger", "Lazy Sorcerer", "Mr. Snow", "Temple Master"
    },
    ["One-Time-Quest"] = {
        "Apple Girl", "Brave Kid", "Climber", "Concerned Woman", "Fort Soldier", 
        "Frustrated Homeowner", "Ivana Coffin", "Janitor", "Jealous Joe", "Lender", 
        "Normal Person", "Swamp Wader"
    },
    ["Heavenly Restriction"] = {
        "Sorcerer Killer"
    },
    Storyline = {
        "Storyline"
    },
    Sandbox = {
        "Sandbox"
    },
    Comedian = {
        "Comedian"
    },
    ["Curse Market"] = {
        "Curse Market"
    },
    ["Clan Head"] = {
        "Clan Head Jujutsu High", "Clan Head Town1", "Clan Head Town2", 
        "Clan Head Town3", "Clan Head Town4", "Clan Head Town5"
    },
    ["Fortress Commander"] = {
        "Fortress Commander"
    }
} 

for subclass, npcs in pairs(npcList) do
    TeleportTab.Dropdown({
        Text = subclass,  -- Use the subclass name as the title for the dropdown
        MultiSelect = false,
        Callback = function(selectedNPCs)
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(workspace.Objects.NPCs[selectedNPCs].HumanoidRootPart.Position)
        end,
        Options = npcs
    })
end

local BossTab = X.New({
    Title = "Bosses"
})

local sectiontestx = BossTab.Section({
	Text = "General",
})

local AutoBossToggle = BossTab.Toggle({
    Text = "Auto-Boss",
    Callback = function(Value)
        -- Set the global 'Bring' variable based on the toggle state
        getgenv().Bring = Value
        ConfigSettings.AutoReplayToggle = Value

        if Value then
            task.spawn(function()
                -- Initial teleport to boss spawn if it exists
                local bossSpawn = workspace.Objects.Spawns:FindFirstChild("BossSpawn")
                if bossSpawn then
                    local adornee = bossSpawn.QuestMarker and bossSpawn.QuestMarker.Adornee
                    local playerCharacter = game.Players.LocalPlayer.Character
                    if adornee and playerCharacter then
                        playerCharacter.HumanoidRootPart.CFrame = adornee.CFrame
                    end
                end

                -- Main farming loop
                while getgenv().Bring do
                    local playerCharacter = game.Players.LocalPlayer.Character
                    local humanoidRootPart = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")

                    if humanoidRootPart then
                        for _, mob in ipairs(workspace.Objects.Mobs:GetChildren()) do
                            local mobHumanoid = mob:FindFirstChild("Humanoid")
                            local mobRootPart = mob:FindFirstChild("HumanoidRootPart")

                            if mobRootPart and mobHumanoid then
                                local mobPosition = mobRootPart.Position
                                local mobLookVector = mobRootPart.CFrame.LookVector
                                local behindPosition = mobPosition - mobLookVector * 6

                                mobHumanoid.Health = 0
                                humanoidRootPart.CFrame = CFrame.new(behindPosition)
                            end
                        end
                    end
                    task.wait() -- Avoid CPU overload
                end
            end)
        else
            -- Stop the farming loop when toggled off
            getgenv().Bring = false
        end
    end,
    Enabled = ConfigSettings.AutoBossToggle
})


local AutoReplayToggle = BossTab.Toggle({
    Text = "Auto-Replay",
    Callback = function(Value)
        getgenv().autoreplay = Value
        ConfigSettings.AutoReplayToggle = Value
        if Value then
            task.spawn(function()
                while getgenv().autoreplay do
                    local player = game:GetService("Players").LocalPlayer
                    local readyScreen = player.PlayerGui.ReadyScreen
                    local lootGui = player.PlayerGui.Loot
                    
                    if readyScreen.Enabled then
                        local chest = workspace.Objects.Drops:FindFirstChild("Chest")
                        
                        if not chest and not lootGui.Enabled then
                            task.wait(0.5)
                            local replayButton = readyScreen.Frame.Replay
                            
                            -- Click replay button
                            game:GetService("GuiService").SelectedObject = replayButton
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end
                    end
                    
                    task.wait(0.5)
                end
            end)
        end
    end,
    Enabled = ConfigSettings.AutoReplayToggle
})

local sectiontest = BossTab.Section({
Text = "Boss Queue",
})

local bosstypedropdown = BossTab.Dropdown({
    Text = "Boss Type",
    Callback = function(Value)
        getgenv().bosstype = Value
    end,
    Options = {
        "Finger Bearer",
        "Ocean Curse",
        "Soul Curse",
        "Volcano Curse",
        "Sorcerer Killer",
        "Heian Imaginary Demon",
        "Spawn of Rot",
        "Cursed School",
        "Yasohachi Bridge",
        "Tokyo Subway",
        "Eerie Farm",
        "Detention Center",
        "Consumables"
    }
})

local uikeybind = BossTab.Dropdown({
    Text = "Boss Difficulty",
    Callback = function(Value)
        getgenv().bossdifficulty = Value
    end,
    Options = {
        "Easy",
        "Medium",
        "Hard",
        "Nightmare"
    }
})


local G = BossTab.Button({
    Text = "Start",
    Callback = function()
        local ohString1 = "Boss"
        local ohString2 = getgenv().bosstype
        local ohString3 = "whatever"
        local ohString4 = getgenv().bossdifficulty
        
    game:GetService("ReplicatedStorage").Remotes.Server.Raids.CreateLobby:InvokeServer(ohString1, ohString2, ohString3, ohString4)
    task.wait(0.25)
    game:GetService("ReplicatedStorage").Remotes.Server.Raids.StartLobby:InvokeServer(ohString1)
    end
})


local SettingsTab = X.New({
    Title = "Settings"
})

local sectiontestx = SettingsTab.Section({
	Text = "Config",
})

local function RefreshConfigList(folder)
    local list = listfiles(folder)

    local out = {}
    for i = 1, #list do
        local file = list[i]
        if file:sub(-5) == ".json" then
            local pos = file:find(".json", 1, true)
            local start = pos

            local char = file:sub(pos, pos)
            while char ~= "/" and char ~= "\\" and char ~= "" do
                pos = pos - 1
                char = file:sub(pos, pos)
            end

            if char == "/" or char == "\\" then
                local name = file:sub(pos + 1, start - 1)
                if name ~= "options" then
                    table.insert(out, name)
                end
            end
        end
    end

    return out
end

-- Path to the folder containing settings
local folder = "xenosjji"
local configFiles = RefreshConfigList(folder)

-- Create the dropdown
local ConfigDropdown = SettingsTab.Dropdown({
    Text = "Selection",
    Callback = function(Value)
        getgenv().selectedfile = Value
    end,
    Options = configFiles
})

local configname = SettingsTab.TextField({
	Text = "Config Name",
	Callback = function(Value)
		getgenv().configname = Value
	end,
})

local G = SettingsTab.Button({
    Text = "Create Config",
    Callback = function()
        ConfigLibrary:SaveConfig("xenosjji/" .. getgenv().configname .. ".json", ConfigSettings)
        print("done cuh")
    end
})

local G = SettingsTab.Button({
    Text = "Load Config",
    Callback = function()
        if not getgenv().selectedfile then
            warn("No file selected!")
            return
        end

        -- Construct the file path and read its contents
        local configPath = "xenosjji/" .. getgenv().selectedfile .. ".json"  -- Specify the correct file path
        local configContent
        local success, errorMessage = pcall(function()
            configContent = readfile(configPath)  -- Read the file content
        end)

        if not success then
            warn("Error reading file: " .. errorMessage)
            return
        end

        -- Decode the JSON content into a Lua table
        local configData
        success, errorMessage = pcall(function()
            configData = game:GetService("HttpService"):JSONDecode(configContent)  -- Decode JSON
        end)

        if not success then
            warn("Error decoding JSON: " .. errorMessage)
            return
        end
        KillAuraToggle:SetState(configData.KillAuraToggle)
        AutoCompleteQuestToggle:SetState(configData.AutoCompleteQuestToggle)
        QuestToggle:SetState(configData.QuestToggle)
        NoCooldownToggle:SetState(configData.NoCooldownToggle)
        AutoPromoteToggle:SetState(configData.AutoPromoteToggle)
        AutoCollectChestsToggle:SetState(configData.AutoCollectChestsToggle)
        AutoCollectDropsToggle:SetState(configData.AutoCollectDropsToggle)       
        AutoBossToggle:SetState(configData.AutoBossToggle)
        AutoReplayToggle:SetState(configData.AutoReplayToggle)
        AutoLoadSelectedConfig:SetState(configData.AutoLoadSelectedConfig)
        SelectedConfig:SetState(configData.SelectedConfig)
        TemporaryUnlockInnateToggle:SetState(configData.TemporaryUnlockInnateToggle)
    end
})

local G = SettingsTab.Button({
    Text = "Save Config",
    Callback = function()
        ConfigLibrary:SaveConfig("xenosjji/" .. getgenv().selectedfile .. ".json", ConfigSettings)
        print("saved")
    end
})

-- Assuming ConfigDropdown is an instance of your dropdown library
local G = SettingsTab.Button({
    Text = "Refresh Config List",
    Callback = function()
    local IWILLDETROYYOU = game:GetService("CoreGui").xenos.MainFrame.Content.SETTINGS.Dropdown.Content:GetChildren()

    for _, child in pairs(IWILLDETROYYOU) do
        if child:IsA("ImageButton") then
        child:Destroy()
        end
    end

        local configFiles = RefreshConfigList("xenosjji")

        ConfigDropdown:SetOptions(configFiles)

        ConfigDropdown:Refresh()
    end
})

local AutoReplayToggle = BossTab.Toggle({
    Text = "Auto-Load-Selected-Config",
    Callback = function(Value)
        getgenv().autoloadconfig = Value
        ConfigSettings.AutoLoadSelectedConfig = Value
        if Value then
            task.spawn(function()
                while getgenv().autoloadconfig do
                    ConfigLibrary:SaveConfig("xenosjji/" .. getgenv().selectedfile .. ".json", ConfigSettings)
                    task.wait(0.5)
                end
            end)
        end
    end,
    Enabled = ConfigSettings.AutoLoadSelectedConfig
})
end

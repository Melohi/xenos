local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Melohi/v3rm/refs/heads/main/materialuiexperiment"))()
local player = game:GetService("Players").LocalPlayer
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
    Callback = function(Value)
        getgenv().QuestType = Value
    end,
    Options = {
        "Normal",
        "Modded"
    }
})

local QuestDropdown = CombatTab.Dropdown({
    Text = "Quest",
    Callback = function(Value)
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

local QuestDropdown = CombatTab.Dropdown({
    Text = "Quest Level",
    Callback = function(Value)
        -- Set the global quest level and update quest details based on selected value
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
    Enabled = false
})

local QuestToggle = CombatTab.Toggle({
    Text = "Auto-Complete-Quest",
    Callback = function(Value)
        getgenv().autcompletequest = Value -- Set the toggle state
        if getgenv().autcompletequest then
            task.spawn(function() -- Run in a separate thread
                while getgenv().autcompletequest do
                    local success, err = pcall(function()
                        local localPlayer = game.Players.LocalPlayer
                        local replicatedTempData = localPlayer:FindFirstChild("ReplicatedTempData")
                        local questData = replicatedTempData and replicatedTempData:FindFirstChild("quest")

                        -- If no active quest, try to take one
                        if not questData then
                            local args = {} -- Replace with the actual arguments for TakeQuest
                            game:GetService("ReplicatedStorage").Remotes.Server.Data.TakeQuest:InvokeServer(args)
                        end

                        -- Move to the quest marker
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

                    task.wait(0.5) -- Add a short delay to avoid excessive execution
                end
            end)
        end
    end,
    Enabled = false -- Default state
})

local sectiontest = CombatTab.Section({
	Text = "General",
})

local KillAura = CombatTab.Toggle({
    Text = "Kill-Aura",
    Callback = function(Value)
        if Value then
            getgenv().KillAura = true
            while getgenv().KillAura do
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if not character or not character:FindFirstChild("HumanoidRootPart") then
                    task.wait(0.1)
                else
                    for _, mob in pairs(game:GetService("Workspace").Objects.Mobs:GetChildren()) do
                        local mobHead = mob:FindFirstChild("Head")
                        local mobHRP = mob:FindFirstChild("HumanoidRootPart")
                        if mobHead and mobHRP then
                            local distance = (mobHRP.Position - character.HumanoidRootPart.Position).Magnitude
                            if distance <= 100 then
                                pcall(function()
                                    mobHead:Destroy()
                                end)
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        else
            getgenv().KillAura = false
        end
    end,
    Enabled = false
})


local NoCooldownToggle = CombatTab.Toggle({
    Text = "No Ability Cooldown",
    Callback = function(Value)
        if Value then
            game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer("0 COOLDOWN FOR DEBUGGING")
        else
            print('irreversible!')
        end
    end,
    Enabled = false
})

local PlayerTab = X.New({
    Title = "Player"
})

local sectiontest = PlayerTab.Section({
	Text = "LocalPlayer",
})

local RejoinAfterKickToggle = PlayerTab.Toggle({
    Text = "Rejoin on kick",
    Callback = function(Value)
        if Value then
            getgenv().rejoinafterkick = true
            print("Rejoin after kick is enabled.")  -- Debug line
            game.Players.PlayerRemoving:Connect(function(plr)
                print("PlayerRemoving event triggered.")  -- Debug line
                if plr == game.Players.LocalPlayer and getgenv().rejoinafterkick then
                    print("Kicked, teleporting back.")  -- Debug line
                    game:GetService('TeleportService'):Teleport(game.PlaceId)
                end
            end)
        else
            getgenv().rejoinafterkick = false
        end
    end,
    Enabled = false
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

local toolsdropdown = PlayerTab.Dropdown({
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
        print("All spawned tools have been cleared.")
    end,
})

local sectiontest = PlayerTab.Section({
	Text = "Auto-Collect",
})

local ACDropdown = PlayerTab.Dropdown({
    Text = "Selection",
    MultiSelect = true,
    Callback = function(Value)
        if type(Value) == "table" then
            print(table.concat(Value, ", "))
        else
            print(Value)
        end
    end,
    Options = {
        "Items",
        "Drops",
        "Chests",
        "Loots",
        "Cursebloom",
        "Talisman"
    }
})


local ACToggle = PlayerTab.Toggle({
    Text = "Auto-Collect",
    Callback = function(Value)
        if Value then
        else
        end
    end,
    Enabled = false
})

local ACToggle = PlayerTab.Toggle({
    Text = "Auto-Promote",
    Callback = function(Value)
        if Value then
            getgenv().autopromote = true
            while getgenv().autopromote do
                local ohString1 = "Clan Head Jujutsu High"
                local ohString2 = "Promote"
                game:GetService("ReplicatedStorage").Remotes.Server.Dialogue.GetResponse:InvokeServer(ohString1, ohString2)
                task.wait(5)
            end
        else
        end
    end,
    Enabled = false
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


local C = CustomizationTab.Toggle({
    Text = "Temporarily Unlock Innate 3 & 4",
    Callback = function(Value)
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
    Enabled = false
})

local sectiontest = CustomizationTab.Section({
	Text = "Customization",
})

local N = CustomizationTab.Button({
    Text = "Redeem All Codes",
    Callback = function()
        local codetable = {"TOP_SECRET", "RELEASE", "MERRY_CHRISTMAS", "SHUTDOWN_AGAIN","BACK_UP_AGAIN"}

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
        if Value then
            getgenv().Bring = true

            if workspace.Objects.Spawns.BossSpawn:FindFirstChild("QuestMarker") then
                local adornee = workspace.Objects.Spawns.BossSpawn:FindFirstChild("QuestMarker").Adornee
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = adornee.CFrame
            end

            -- Function to bring the player around mobs
            local function bringPlayerAroundMobs()
                local localPlayer = game.Players.LocalPlayer
                local jogador = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

                if jogador then
                    for _, mob in pairs(workspace.Objects.Mobs:GetChildren()) do
                        if mob:FindFirstChild("HumanoidRootPart") then
                            -- Calculate position 5 studs behind the mob
                            local mobPosition = mob.HumanoidRootPart.Position
                            local mobLookVector = mob.HumanoidRootPart.CFrame.LookVector
                            local novaPosicao = mobPosition - mobLookVector * 6 -- Adjust distance here (currently 5 studs)
                            
                            mob.Humanoid.Health = 0
                            -- Teleport the player
                            jogador.CFrame = CFrame.new(novaPosicao)
                        end
                    end
                end
            end

            -- Continuously bring the player around mobs
            while getgenv().Bring do
                bringPlayerAroundMobs()
                task.wait() -- Adjust the wait time as needed
            end
        else
            getgenv().Bring = false
        end
    end,
    Enabled = getgenv().AutoBossToggle
})

local AutoReplayToggle = BossTab.Toggle({
    Text = "Auto-Replay",
    Callback = function(Value)
        if Value then
            getgenv().autoreplay = true
            while getgenv().autoreplay == true do
                if game:GetService("Players").LocalPlayer.PlayerGui.ReadyScreen.Enabled == true then
                    local chest = workspace.Objects["Drops"]:FindFirstChild("Chest")
                        if chest then
                                print("claim that shit cuh")
                        else
                            if game:GetService("Players").LocalPlayer.PlayerGui.Loot.Enabled == false then
                        task.wait(3)
                        local button = game:GetService("Players").LocalPlayer.PlayerGui.ReadyScreen.Frame.Replay
                        game:GetService("GuiService").SelectedObject = button
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                            end
                            end
                    else
                end
                task.wait(5)
            end
        else
            getgenv().autoreplay = false
        end
    end,
    Enabled = getgenv().AutoReplayToggle
})

local AutoCollectToggle = BossTab.Toggle({
    Text = "Auto-Collect Chests",
    Callback = function(Value)
        getgenv().autocollectchest = Value
        if getgenv().autocollectchest then
            task.spawn(function()
                while getgenv().autocollectchest do
                    local chest = workspace.Objects["Drops"]:FindFirstChild("Chest")
                if game:GetService("Players").LocalPlayer.PlayerGui.Loot.Enabled == false then
                    if chest then
                        local collectPrompt = chest:FindFirstChild("Collect")
                        if collectPrompt then
                            fireproximityprompt(collectPrompt, 1, false)
                        end
                    end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Loot.Enabled == true then
                        local button = game:GetService("Players").LocalPlayer.PlayerGui.Loot.Frame.Flip
                        game:GetService("GuiService").SelectedObject = button
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                    task.wait() -- Add a short delay to prevent excessive resource usage
                end
            end)
        end
    end,
    Enabled = getgenv().AutoCollectChestsToggle -- Default state of the toggle
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

local ConfigTab = X.New({
    Title = "Config"
})


local AutoCollectToggle = ConfigTab.Toggle({
    Text = "save that shit (only works on bosses for now)",
    Callback = function(Value)
        getgenv().configsaved = Value
        if getgenv().configsaved then
            task.spawn(function()
                while getgenv().configsaved do

                    task.wait()
                end
            end)
        end
    end,
    Enabled = true
})

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
        print(getgenv().QuestType)
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
                        ["type"] = getgenv().QuestType,
                        ["set"] = "Umi Village Set",
                        ["rewards"] = {
                            ["essence"] = 2,
                            ["cash"] = 12000,
                            ["exp"] = 280000,
                            ["chestMeter"] = 55
                        },
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value,
                        ["difficulty"] = 2,
                        ["title"] = getgenv().QuestType,
                        ["level"] = 60,
                        ["amount"] = (getgenv().QuestType == "Band" or getgenv().QuestType == "Exorcise") and 4 or 1,
                        ["subtitle"] = "",
                        ["rewardsText"] = "280,000 Exp | 12,000 Cash | xenos.private"
                    }
            
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                elseif getgenv().QuestLevel == "Level 60 - 120" then
                    local ohTable1 = {
                        ["type"] = getgenv().QuestType,
                        ["set"] = "Umi Village Set",
                        ["rewards"] = {
                            ["essence"] = 4,
                            ["chestMeter"] = 100,
                            ["exp"] = 600000,
                            ["cash"] = 14000
                        },
                        ["rewardsText"] = "600,000 Exp | 14,000 Cash | xenos.private",
                        ["difficulty"] = 2,
                        ["title"] = getgenv().QuestType,
                        ["amount"] = (getgenv().QuestType == "Band" or getgenv().QuestType == "Exorcise") and 4 or 1,
                        ["level"] = 120,
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value,
                        ["subtitle"] = ""
                    }
            
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                elseif getgenv().QuestLevel == "Level 120 - 180" then
                    local ohTable1 = {
                        ["type"] = getgenv().QuestType,
                        ["set"] = "Numa Temple Set",
                        ["rewards"] = {
                            ["essence"] = 10,
                            ["chestMeter"] = 100,
                            ["exp"] = 3500000,
                            ["cash"] = 36000
                        },
                        ["rewardsText"] = "3,500,000 Exp | 36,000 Cash | xenos.private",
                        ["difficulty"] = 2,
                        ["title"] = getgenv().QuestType,
                        ["amount"] = (getgenv().QuestType == "Band" or getgenv().QuestType == "Exorcise") and 4 or 1,
                        ["level"] = 180,
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value,
                        ["subtitle"] = ""
                    }
            
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                elseif getgenv().QuestLevel == "Level 180 - 240+" then
                    local ohTable1 = {
                        ["type"] = getgenv().QuestType,
                        ["set"] = "Numa Temple Set",
                        ["rewards"] = {
                            ["essence"] = 10,
                            ["cash"] = 40000,
                            ["exp"] = 7500000,
                            ["chestMeter"] = 55
                        },
                        ["rewardsText"] = "7,500,000 Exp | 40,000 Cash | xenos.private",
                        ["difficulty"] = 2,
                        ["title"] = getgenv().QuestType,
                        ["amount"] = (getgenv().QuestType == "Band" or getgenv().QuestType == "Exorcise") and 4 or 1,
                        ["level"] = 400,
                        ["subtitle"] = "",
                        ["grade"] = game:GetService("Players").LocalPlayer.ReplicatedData.grade.Value
                    }
                
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.AcceptQuest:InvokeServer(ohTable1)
                end

                local localPlayer = game.Players.LocalPlayer

                if getgenv().autcompletequest == true then
                    local questData = localPlayer:FindFirstChild("ReplicatedTempData") and localPlayer.ReplicatedTempData:FindFirstChild("quest")
                    if not questData then
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.Server.Data.TakeQuest:InvokeServer(args)
                        end)
                    end

                    local localPlayer = game.Players.LocalPlayer
                    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    local questMarker = localPlayer.PlayerGui:WaitForChild("QuestMarker")
                    local adornee = questMarker.Adornee

                    if adornee and adornee:IsA("BasePart") then
                        humanoidRootPart.CFrame = adornee.CFrame
                    end
                end
                task.wait(0.1)
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
        if Value then
            getgenv().autcompletequest = true
        else
            getgenv().autcompletequest = false
        end
    end,
    Enabled = false
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

local WalkSpeedSlider = PlayerTab.Slider({
	Text = "WalkSpeed",
	Callback = function(Value)
		player.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = Value
	end,
	Min = 40,
	Max = 350,
	Def = 40
})

local JumpPowerSlider = PlayerTab.Slider({
	Text = "JumpPower",
	Callback = function(Value)
		player.LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = Value
	end,
	Min = 77,
	Max = 350,
	Def = 40
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

local ConfigTab = X.New({
    Title = "Settings"
})

local sectiontest = ConfigTab.Section({
	Text = "GUI Keybind",
})

local uikeybind = ConfigTab.Dropdown({
    Text = "Selection",
    Callback = function(Value)
        print(Value)
    end,
    Options = {
        "RightShift",
        "Insert",
        "RightAlt"
    },
    Menu = {
        Information = function(self)
            X.Banner({
                Text = "Test alert!"
            })
        end
    }
})

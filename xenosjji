local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Melohi/v3rm/refs/heads/main/materialuiexperiment"))()

local X = Material.Load({
    Title = "xenos.private",
    Style = 2,
    SizeX = 500,
    SizeY = 350,
    Theme = "Jester",
    ColorOverrides = {}
})

local Y = X.New({
    Title = "Customization"
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

local function handleDropdownSelection(selectedValues, globalVarName)
    if type(selectedValues) == "table" then
        getgenv()[globalVarName] = selectedValues
        print(table.concat(selectedValues, ", "))
    else
        getgenv()[globalVarName] = {selectedValues}
        print(selectedValues)
    end
end

local function createDropdown(parent, text, globalVarName)
    local options = {}
    for _, technique in ipairs(innateTechniques) do
        table.insert(options, technique.name)
    end

    return parent.Dropdown({
        Text = text,
        MultiSelect = true,
        Callback = function(Value)
            handleDropdownSelection(Value, globalVarName)
        end,
        Options = options,
        OptionColors = function(option)
            for _, technique in ipairs(innateTechniques) do
                if technique.name == option then
                    return tierColors[technique.tier]
                end
            end
            return Color3.fromRGB(255, 255, 255)
        end
    })
end

createDropdown(Y, "Desired Innate 1", "desiredInnates1")
createDropdown(Y, "Desired Innate 2", "desiredInnates2")
createDropdown(Y, "Desired Innate 3", "desiredInnates3")
createDropdown(Y, "Desired Innate 4", "desiredInnates4")

local B = Y.Toggle({
    Text = "Auto-Spin",
    Callback = function(Value)
        if Value then
            getgenv().autospin = true
            while getgenv().autospin do
                local innate1Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["1"].Value
                local innate2Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["2"].Value
                local innate3Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["3"].Value
                local innate4Value = game:GetService("Players").LocalPlayer.ReplicatedData.innates["4"].Value

                local innate1Matched = table.find(getgenv().desiredInnates1, innate1Value)
                local innate2Matched = table.find(getgenv().desiredInnates2, innate2Value)
                local innate3Matched = table.find(getgenv().desiredInnates3, innate3Value)
                local innate4Matched = table.find(getgenv().desiredInnates4, innate4Value)

                if innate1Matched and innate2Matched and innate3Matched and innate4Matched then
                    print("All desired innates obtained!")
                    break
                end

                if not innate1Matched then
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.InnateSpin:InvokeServer(1)
                    print("Spinning for Innate 1: Current Value - " .. innate1Value)
                end

                if not innate2Matched then
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.InnateSpin:InvokeServer(2)
                    print("Spinning for Innate 2: Current Value - " .. innate2Value)
                end

                if not innate3Matched then
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.InnateSpin:InvokeServer(3)
                    print("Spinning for Innate 3: Current Value - " .. innate3Value)
                end

                if not innate4Matched then
                    game:GetService("ReplicatedStorage").Remotes.Server.Data.InnateSpin:InvokeServer(4)
                    print("Spinning for Innate 4: Current Value - " .. innate4Value)
                end

                game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["1"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["1"].Value
                game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["2"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["2"].Value
                game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["3"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["3"].Value
                game:GetService("Players").LocalPlayer.PlayerGui.Customization.Frame.List.Innates["4"].Frame.TextLabel.Text = game:GetService("Players").LocalPlayer.ReplicatedData.innates["4"].Value
                updateInnateUI()
                task.wait(0.02)
            end
        else
            getgenv().autospin = false
        end
    end,
    Enabled = false
})

local C = Y.Toggle({
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

local A = Y.Button({
    Text = "Redeem All Codes",
    Callback = function()
        local codetable = {"TOP_SECRET", "MERRY_CHRISTMAS", "MISSION_SHUTDOWN", "RELEASE"}

        for _, code in ipairs(codetable) do
            game:GetService("ReplicatedStorage").Remotes.Server.Data.RedeemCode:InvokeServer(code)
        task.wait(5)
        end
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = "This will wipe everything in your account, you don't have to redo the tutorial after use"
            })
        end
    }
})

local A = Y.Button({
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

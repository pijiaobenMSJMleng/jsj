local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/pijiaobenMSJMleng/jsj/refs/heads/main/REDzGui.lua"))()

local Window = redzlib:MakeWindow({
  Title = "孙雪怡皇帝专用",
  SubTitle = "专用脚本",
  SaveFolder = "Redz Config"
})

print("反挂机")
Start = tick()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)

Window:AddMinimizeButton({
  Button = { Image = redzlib:GetIcon("czl"), BackgroundTransparency = 0,Size = UDim2.fromOffset(60, 60), },
  Corner = { CornerRadius = UDim.new(0, 10) }
})

local Tab = Window:MakeTab({"公告", "cool"})


Tab:AddDiscordInvite({
    Title = "我是孙雪怡",
    Logo = "rbxassetid://18942670945",
    Invite = "牛逼！"
})

Tab:AddSection("脚本已开启反挂机")

Tab:AddSection("无敌")

local Tab = Window:MakeTab({"玩家", "cool"})

local dul = {"哑铃","倒立","仰卧起坐","俯卧撑"}

local dq = ""

local cs = Tab:AddDropdown({
  Name = "请选择锻炼类型",
  Options = dul,
  Default = "...",
  Callback = function(Value)
     dq = Value         
  end
})

Tab:AddToggle({
  Name = "自动锻炼",  
  Default = false,
  Callback = function(Value)
     autowork = Value
		game:GetService("RunService").Stepped:connect(
		function()
			pcall(
				function()
					if autowork then
					local args = {
    [1] = "rep"
}

game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
						if autowork then
						    if dq == "哑铃" then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Weight)
							elseif dq == "倒立" then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Handstands)
							elseif dq == "仰卧起坐" then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Situps)
							elseif dq == "俯卧撑" then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Pushups)
							end	
						end
					end
				end
			)
		end
		)
  end
})

Tab:AddTextBox({
    Title = "挥拳速度",
    Description = "调前把拳头取消装备后才可以调",
    Default = "0",
    PlaceholderText = "请输入挥拳的速度",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.Backpack.Punch:FindFirstChildOfClass("NumberValue").Value = Value
end
})

local Tab = Window:MakeTab({ "击杀", "cool" })

local Players = game:GetService("Players")
local whitelist = {}
local blacklist = {}
local targetPlayers = {}
 
Tab:AddTextBox({
    Title = "白名单",
    Default = "",
    PlaceholderText = "输入白名单",
    ClearText = true,
    Callback = function(input)
        local playerName = input:match("^%s*(.-)%s*$")
        if playerName and playerName ~= "" then
            local player = Players:FindFirstChild(playerName)
            if player then
                if not table.find(whitelist, playerName) then
                    table.insert(whitelist, playerName)
                end
            end
        end
    end
})

Tab:AddTextBox({
    Title = "取消白名单",
    Default = "",
    PlaceholderText = "输入用户名",
    ClearText = true,
    Callback = function(input)
        local playerName = input:match("^%s*(.-)%s*$")
        if playerName and playerName ~= "" then
            local player = Players:FindFirstChild(playerName)
            if player then
                if not table.find(blacklist, playerName) then
                    table.insert(blacklist, playerName)
                end
            end
        end
    end
})

Tab:AddTextBox({
    Title = "锁定击杀",
    Default = "",
    PlaceholderText = "输入用户名",
    ClearText = true,
    Callback = function(input)
        for playerName in input:gmatch("([^,]+)") do
            playerName = playerName:match("^%s*(.-)%s*$")
            if playerName and playerName ~= "" then
                targetPlayers[playerName] = true
            end
        end
    end
})

Tab:AddTextBox({
    Title = "停止锁定击杀",
    Default = "",
    PlaceholderText = "输入用户名",
    ClearText = true,
    Callback = function(input)
        local playerName = input:match("^%s*(.-)%s*$")
        if playerName and playerName ~= "" then
            targetPlayers[playerName] = nil
        end
    end
})

local function isInWhitelist(player)
    return table.find(whitelist, player.Name) ~= nil
end

local function isInBlacklist(player)
    return table.find(blacklist, player.Name) ~= nil
end

local function touchHead(player)
    local character = player.Character
    if character and not isInWhitelist(player) and not isInBlacklist(player) then
        local head = character:FindFirstChild("Head")
        local localPlayer = game.Players.LocalPlayer
        local leftHand = localPlayer and localPlayer.Character:FindFirstChild("LeftHand")
        if head and leftHand then
            pcall(function()
                firetouchinterest(head, leftHand, 0)
                wait(0.01)
                firetouchinterest(head, leftHand, 1)
            end)
        end
    end
end

Tab:AddToggle({
    Name = "自动击杀全部",
    Default = false,
    Callback = function(bool)
        if bool then
            _G.autokill = true
            local isRunning = false

            local function main()
                while _G.autokill do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= Players.LocalPlayer then
                            touchHead(player)
                        end
                    end
                    wait(1 * 0.1)
                end
            end

            local function startCode()
                isRunning = true
                main()
            end

            startCode()
        else
            _G.autokill = false
        end
    end
})

local killEnabled = false
Tab:AddToggle({
    Name = "锁定击杀玩家",
    Default = false,
    Callback = function(bool)
        if bool then
            killEnabled = true
            local function killTargetPlayers()
                while killEnabled do
                    for playerName, _ in pairs(targetPlayers) do
                        local player = Players:FindFirstChild(playerName)
                        if player then
                            pcall(function()
                                local myCharacter = game.Players.LocalPlayer.Character
                                local targetCharacter = player.Character
                                if targetCharacter then
                                    targetCharacter.Head.Anchored = true
                                    targetCharacter.Head.CanCollide = false
                                    pcall(function()
                                        if targetCharacter.Head.Neck.Name == "Neck" and targetCharacter.Head.nameGui then
                                            targetCharacter.Head.nameGui:Clone().Parent = targetCharacter.UpperTorso
                                            targetCharacter.Head.Neck:Destroy()
                                            targetCharacter.Head.nameGui:Destroy()
                                            targetCharacter.Head.Transparency = 1
                                            targetCharacter.Head.Face:Destroy()
                                        end
                                    end)
                                    pcall(function()
                                        local args = {[1] = "punch",[2] = "leftHand"}
                                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
                                        local args = {[1] = "punch",[2] = "rightHand"}
                                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
                                        wait()
                                        targetCharacter.Head.Position = Vector3.new(myCharacter.LeftHand.Position.X, myCharacter.LeftHand.Position.Y, myCharacter.LeftHand.Position.Z)
                                    end)
                                end
                            end)
                        end
                    end
                    wait(1)
                end
            end
            killTargetPlayers()
        else
            killEnabled = false
        end
    end
})

Tab:AddToggle({
  Name = "自动挥拳",  
  Default = false,
  Callback = function(Value)
    punstone = Value
		game:GetService("RunService").Stepped:connect(
		function()
			pcall(
				function()
					if punstone then
					local args = {
    [1] = "punch",
    [2] = "leftHand"
}

game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))

						if punstone then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(
								game:GetService("Players").LocalPlayer.Backpack.Punch
							)
						end
					end
				end
			)
		end
		)
  end
})

Tab:AddButton({"传送到安全位置", function()
local plr = game.Players
local lplr = plr.LocalPlayer
local lchar = lplr.Character
local HRP = lchar.HumanoidRootPart
 
HRP.CFrame = CFrame.new(-300, 100100, -450)
 
local C = Instance.new("Part")
C.Parent = workspace
C.CFrame = CFrame.new(-300, 100000, -450)
C.Size = Vector3.new(1000000, 0, 10000000)
C.Anchored = true
end})

Tab:AddToggle({
  Name = "锁定位置",  
  Default = false,
  Callback = function(Value)
    local RunService = game:GetService("RunService")

local initialPosition = nil
    
    getgenv().LockPosition = Value
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    if Value then

        initialPosition = character:WaitForChild("HumanoidRootPart").Position

        local function updatePosition()
            if getgenv().LockPosition then
                character:SetPrimaryPartCFrame(CFrame.new(initialPosition))
            end
        end

        RunService.RenderStepped:Connect(updatePosition)
    else

        if initialPosition then
            local rootPart = character:WaitForChild("HumanoidRootPart")
            rootPart.CFrame = CFrame.new(initialPosition)
            initialPosition = nil
        end
    end
  end
})

local Tab = Window:MakeTab({"石头", "cool"})

local deg = {"蓝石头","橙石头","白石头","绿石头","红石头"}

local sxnl = ""

local n = ""

local cs = Tab:AddDropdown({
  Name = "选择石头",
  Description = " ",
  Options = deg,
  Default = "...",
  Callback = function(Value)
     n = Value
     if n == "蓝石头" then
     sxnl = "150k"
     elseif n == "橙石头" then
     sxnl = "750k"
     elseif n == "白石头" then
     sxnl = "1m"
     elseif n == "绿石头" then
     sxnl = "5m"
     elseif n == "红石头" then
     sxnl = "10m"
     end
  end
})

local Section = Tab:AddSection("隔空打石头")

Tab:AddToggle({
  Name = "自动打石头",  
  Default = false,
  Callback = function(Value)
  if n == "蓝石头" then
     getgenv().FrozenRock = Value
        spawn(function()
            while wait() do
                if getgenv().FrozenRock then
                    firetouchinterest(game.workspace.machinesFolder["Frozen Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
                    wait(0.01)
                    firetouchinterest(game.workspace.machinesFolder["Frozen Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
                end
            end
        end)
   elseif n == "橙石头" then   
    getgenv().InfernoRock = Value
        spawn(function()
            while wait() do
                if getgenv().InfernoRock then
                    firetouchinterest(game.workspace.machinesFolder["Inferno Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
                    wait(0.01)
                    firetouchinterest(game.workspace.machinesFolder["Inferno Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
                end
            end
        end)
        elseif n == "白石头" then
        getgenv().RockOfLegends = Value
        spawn(function()
            while wait() do
                if getgenv().RockOfLegends then
                    firetouchinterest(game.workspace.machinesFolder["Rock Of Legends"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
                    wait(0.01)
                    firetouchinterest(game.workspace.machinesFolder["Rock Of Legends"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
                end
            end
        end)
        elseif n == "绿石头" then
        getgenv().MuscleKing = Value
        spawn(function()
            while wait() do
                if getgenv().MuscleKing then
                    firetouchinterest(game.workspace.machinesFolder["Muscle King Mountain"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
                    wait(0.01)
                    firetouchinterest(game.workspace.machinesFolder["Muscle King Mountain"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
                end
            end
        end)  
        elseif n == "红石头" then
        getgenv().AncientJungleRock = Value
        spawn(function()
            while wait() do
                if getgenv().AncientJungleRock then
                    firetouchinterest(game.workspace.machinesFolder["Ancient Jungle Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
                    wait(0.01)
                    firetouchinterest(game.workspace.machinesFolder["Ancient Jungle Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
                end
            end
        end)  
        end
  end
})

Tab:AddToggle({
  Name = "自动挥拳",  
  Default = false,
  Callback = function(Value)
    punstone = Value
		game:GetService("RunService").Stepped:connect(
		function()
			pcall(
				function()
					if punstone then
					local args = {
    [1] = "punch",
    [2] = "leftHand"
}

game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))

						if punstone then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(
								game:GetService("Players").LocalPlayer.Backpack.Punch
							)
						end
					end
				end
			)
		end
		)
  end
})

local qq = Tab:AddSection("切换石头前，请先把自动打石头给关了")

local Tab = Window:MakeTab({"宠物", "cool"})

local Section = Tab:AddSection("购买")

local buyjc = {"暗星","赛博龙","肌肉之王","霓虹守护者","肌肉老师","熵爆"}

local bpqq = ""

local cs = Tab:AddDropdown({
  Name = "宠物",
  Options = buyjc,
  Default = "...",
  Callback = function(Value)
     buyp = Value
     if buyp == "暗星" then
     bpqq = "Darkstar Hunter" 
     elseif buyp == "赛博龙" then
     bpqq = "Cybernetic Showdown Dragon"
     elseif buyp == "肌肉之王" then
     bpqq = "Muscle King"
     elseif buyp == "霓虹守护者" then
     bpqq = "Neon Guardian"
     elseif buyp == "肌肉老师" then
     bpqq = "Muscle Sensei"
     elseif buyp == "熵爆" then
     bpqq = "Entropic Blast"
     end       
  end
})

_G.autobuyp = true

function autobuyp()
	while _G.autobuyp == true do
	wait()
	local args = {
    [1] = game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(""..bpqq)
}

game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(unpack(args))
	end
end	

Tab:AddToggle({
  Name = "自动购买",  
  Default = false,
  Callback = function(Value)
    _G.autobuyp = Value
        autobuyp()
  end
})

local Section = Tab:AddSection("进化")

_G.qii = true

function qii()
	while _G.qii == true do
	wait()
	local args = {
    [1] = "evolvePet",
    [2] = "Darkstar Hunter"
}

game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(unpack(args))
	end
end	

Tab:AddToggle({
  Name = "自动进化暗星",  
  Default = false,
  Callback = function(Value)
    _G.qii = Value
        qii()
  end
})

_G.qoo = true

function qoo()
	while _G.qoo == true do
	wait()
	local args = {
    [1] = "evolvePet",
    [2] = "Cybernetic Showdown Dragon"
}

game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(unpack(args))
	end
end	

Tab:AddToggle({
  Name = "自动进化赛博龙",  
  Default = false,
  Callback = function(Value)
    _G.qoo = Value
        qoo()
  end
})

_G.oiu = true

function oiu()
	while _G.oiu == true do
	wait()
	local args = {
    [1] = "evolvePet",
    [2] = "Neon Guardian"
}

game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(unpack(args))
	end
end	

Tab:AddToggle({
  Name = "自动进化霓虹守护者",  
  Default = false,
  Callback = function(Value)
    _G.oiu = Value
        oiu()
  end
})

_G.qwe = true

function qwe()
	while _G.qwe == true do
	wait()
	local args = {
    [1] = "evolvePet",
    [2] = "Muscle Sensei"
}

game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer(unpack(args))

	end
end	

Tab:AddToggle({
  Name = "自动进化肌肉老师",  
  Default = false,
  Callback = function(Value)
    _G.qwe = Value
        qwe()
  end
})

local qq = Tab:AddSection("背包满了或钻石不够 则不能购买宠物")

local Tab = Window:MakeTab({"查看", "cool"})

Tab:AddSection("个人信息")

local myl = Tab:AddSection("力量:")
spawn(function()
while wait() do
pcall(function()
myl:Set("力量:"..game:GetService("Players").LocalPlayer.leaderstats.Strength.Value )
end)
end
end)

local nlll = Tab:AddSection("耐力:")
spawn(function()
while wait() do
pcall(function()
nlll:Set("耐力:"..game:GetService("Players").LocalPlayer.Durability.Value)
end)
end
end)

local mjjj = Tab:AddSection("敏捷:")
spawn(function()
while wait() do
pcall(function()
mjjj:Set("敏捷:"..game:GetService("Players").LocalPlayer.Agility.Value)
end)
end
end)

local mycs = Tab:AddSection("重生:")
spawn(function()
while wait() do
pcall(function()
mycs:Set("重生:"..game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value)
end)
end
end)

local mybs = Tab:AddSection("宝石:")
spawn(function()
while wait() do
pcall(function()
mybs:Set("宝石:"..game:GetService("Players").LocalPlayer.Gems.Value)
end)
end
end)

Tab:AddSection("他人信息")

local srpn = ""

Tab:AddTextBox({
    Title = "请输入玩家用户名",
    Default = "",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    srpn = Value
end
})

local pmyl = Tab:AddSection("力量:")
spawn(function()
while wait() do
pcall(function()
pmyl:Set("力量:"..game:GetService("Players")[srpn].leaderstats.Strength.Value)
end)
end
end)

local pnlll = Tab:AddSection("耐力:")
spawn(function()
while wait() do
pcall(function()
pnlll:Set("耐力:"..game:GetService("Players")[srpn].Durability.Value)
end)
end
end)

local pmjjj = Tab:AddSection("敏捷:")
spawn(function()
while wait() do
pcall(function()
pmjjj:Set("敏捷:"..game:GetService("Players")[srpn].Agility.Value)
end)
end
end)

local pmycs = Tab:AddSection("重生:")
spawn(function()
while wait() do
pcall(function()
pmycs:Set("重生:"..game:GetService("Players")[srpn].leaderstats.Rebirths.Value)
end)
end
end)

local pmybs = Tab:AddSection("宝石:")
spawn(function()
while wait() do
pcall(function()
pmybs:Set("宝石:"..game:GetService("Players")[srpn].Gems.Value)
end)
end
end)

local Tab = Window:MakeTab({"修改", "cool"})

Tab:AddTextBox({
    Title = "力量",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.leaderstats.Strength.Value = Value
end
})

Tab:AddTextBox({
    Title = "耐力",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
   game:GetService("Players").LocalPlayer.Durability.Value = Value
end
})

Tab:AddTextBox({
    Title = "敏捷",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.Agility.Value = Value
end
})

Tab:AddTextBox({
    Title = "重生",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = Value
end
})

Tab:AddTextBox({
    Title = "宝石",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.Gems.Value = Value
end
})

Tab:AddTextBox({
    Title = "好人业报",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.goodKarma.Value = Value
end
})

Tab:AddTextBox({
    Title = "坏人业报",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.evilKarma.Value = Value
end
})

Tab:AddTextBox({
    Title = "总业报",
    PlaceholderText = "请输入",
    ClearText = false,
    Callback = function(Value)
    game:GetService("Players").LocalPlayer.leaderstats.Kills.Value = Value
end
})






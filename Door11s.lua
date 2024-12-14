if getgenv().ED_AntiKick then
	return
end

getgenv().ED_AntiKick = {
	Enabled = true, -- Set to false if you want to disable the Anti-Kick.
	SendNotifications = true, -- Set to true if you want to get notified for every event
	CheckCaller = true -- Set to true if you want to disable kicking by other executed scripts
}
local dropdown = {}
local playernamedied = ""

for i, player in pairs(game.Players:GetPlayers()) do
    dropdown[i] = player.Name
end

function Notify(top, text, ico, dur)
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = top,
    Text = text,
    Icon = ico,
    Duration = dur,
  })
end

local Lengui = loadstring(game:HttpGet("https://raw.githubusercontent.com/LENG8123/UI/refs/heads/main/%E5%86%B7library.lua"))()     
local win = Lengui:new("冷脚本")
--
local UITab1 = win:Tab("『信息』",'87437251671184')

local about = UITab1:section("『LENG Script』",false)

about:Label("冷脚本")
about:Label("作者QQ：2368002332")
about:Label("QQ群：815883059")
about:Label("作者：冷")
about:Label("进群发最新冷脚本")
about:Label("脚本持续更新中")
about:Label("帮助者:月星,小皮,lishichuan丁丁")
about:Label("月星,小皮,lishichuan丁丁是冷一辈子的恩人")
about:Label("脚本懒得优化")
about:Label("欢迎使用🤓")

local UITab2 = win:Tab("帮助榜",'87437251671184')

local about = UITab2:section("『LENG Script』",true)

about:Label("NO.1:月星")
about:Label("NO.2:小皮")
about:Label("NO.3:小玄奘")
about:Label("NO.4:小云")
about:Label("NO.5:丁丁")
about:Label("NO.6:林")

local UITab3 = win:Tab("出生榜",'87437251671184')

local about = UITab3:section("『LENG Script』",true)
    
about:Label("NO.1:念初")
about:Label("NO.2:小鹤")
about:Label("NO.3:神青")
about:Label("NO.4:红毛狗头")

local UITab4 = win:Tab("加入服务器",'87437251671184')

local about = UITab4:section("『LENG Script』",true)

about:Button("加入极速传奇",function()
local game_id = 3101667897
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)

about:Button("加入鲨口生求2",function()
local game_id = 8908228901
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)

about:Button("加入监狱人生",function()
local game_id = 155615604
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)

about:Button("加入忍者传奇",function()
local game_id = 3956818381
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)

about:Button("加入Break in (故事)",function()
local game_id = 1318971886
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)

about:Button("加入自然灾害生存游戏",function()
local game_id = 189707
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)

about:Button("加入力量传奇",function()
local game_id = 3623096087
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)

about:Button("加入餐厅大亨2",function()
local game_id = 3398014311
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
end)
    
local UITab5 = win:Tab("复制冷脚本群系列",'87437251671184')

local about = UITab5:section("『LENG Script』",true)

    about:Button("点我复制冷脚本交流群群",function()
    setclipboard("815883059")
end)

    about:Button("点我复制解卡群",function()
    setclipboard("825789553")
end)

    about:Button("点我复制作者QQ",function()
    setclipboard("2368002332")
end)

local UITab6 = win:Tab("『通用』",'87437251671184')

local about = UITab6:section("『通用』",true)

local Players = about:Dropdown("选择玩家", 'Dropdown', dropdown, function(v)
    playernamedied = v
end)

game.Players.ChildAdded:Connect(function(player)
    dropdown[player.UserId] = player.Name
    Players:AddOption(player.Name)
end)

game.Players.ChildRemoved:Connect(function(player)
    Players:RemoveOption(player.Name)
    for k, v in pairs(dropdown) do
        if v == player.Name then
            dropdown[k] = nil
        end
    end
end)

about:Button("传送到玩家旁边", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        Notify("冷", "已经传送到玩家身边", "rbxassetid://", 5)
    else
        Notify("冷", "无法传送 玩家已消失", "rbxassetid://", 5)
    end
end)

about:Button("把玩家传送过来", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        tp_player.Character.HumanoidRootPart.CFrame = HumRoot.CFrame + Vector3.new(0, 3, 0)
        Notify("冷", "已传送过来", "rbxassetid://", 5)
    else
        Notify("冷", "无法传送 玩家已消失", "rbxassetid://", 5)
    end
end)

about:Toggle("查看玩家", 'Toggleflag', false, function(state)
    if state then
        game:GetService('Workspace').CurrentCamera.CameraSubject =
            game:GetService('Players'):FindFirstChild(playernamedied).Character.Humanoid
            Notify("冷", "已开启", "rbxassetid://", 5)
    else
        Notify("冷", "已关闭", "rbxassetid://", 5)
        local lp = game.Players.LocalPlayer
        game:GetService('Workspace').CurrentCamera.CameraSubject = lp.Character.Humanoid
    end
end)

about:Button("玩家加入游戏提示",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end)

about:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    about:Button("关闭脚本",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)
    
about:Toggle("移除UI辉光", "DHG", false, function(DHG)
    if DHG then
        game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = false
    else
        game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = true
    end
end)

local about = UITab6:section("『自瞄』",true)

about:Button("冷自瞄（死亡消失）",function()
loadstring(game:HttpGet("https://pastefy.app/ZYMlyhhz/raw",true))()
end)

about:Button("宙斯自瞄",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
end)

about:Button("英文自瞄",function()
loadstring(game:HttpGet("https://rentry.co/n55gmtpi/raw", true))()
end)

about:Button("自瞄50",function()
loadstring(game:HttpGet("https://pastefy.app/b3uXjRF6/raw",true))()
end)

about:Button("自瞄100",function()
loadstring(game:HttpGet("https://pastefy.app/tQrd2r0L/raw",true))()
end)

about:Button("自瞄150",function()
loadstring(game:HttpGet("https://pastefy.app/UOQWFvGp/raw",true))()
end)

about:Button("自瞄200",function()
loadstring(game:HttpGet("https://pastefy.app/b5CuDuer/raw",true))()
end)

about:Button("自瞄250",function()
loadstring(game:HttpGet("https://pastefy.app/p2huH7eF/raw",true))()
end)

about:Button("自瞄300",function()
loadstring(game:HttpGet("https://pastefy.app/nIyVhrvV/raw",true))()
end)

about:Button("自瞄350",function()
loadstring(game:HttpGet("https://pastefy.app/pnjKHMvV/raw",true))()
end)

about:Button("自瞄400",function()
loadstring(game:HttpGet("https://pastefy.app/LQuP7sjj/raw",true))()
end)

about:Button("自瞄600",function()
loadstring(game:HttpGet("https://pastefy.app/WmcEe2HB/raw",true))()
end)

about:Button("自瞄全屏",function()
loadstring(game:HttpGet("https://pastefy.app/n5LhGGgf/raw",true))()
end)

local about = UITab6:section("『范围』",true)

about:Textbox("自定义范围!", "HitBox", "输入", function(Value)
   _G.HeadSize = Value
    _G.Disabled = true 
   game:GetService('RunService').RenderStepped:connect(function()
    if _G.Disabled then
    for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
    pcall(function()
    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
   v.Character.HumanoidRootPart.Transparency = 0.7 
   v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
    v.Character.HumanoidRootPart.Material = "Neon"
    v.Character.HumanoidRootPart.CanCollide = false
    end)
    end 
   end 
   end
    end)
end)

about:Button("普通范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end)

about:Button("中等范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end)

about:Button("全图范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()
end)

about:Button("终极范围",function()
loadstring(game:HttpGet("https://pastebin.com/raw/CAQ9x4A7"))()
end)

local about = UITab6:section("『剩下懒得排了』",true)

about:Button("反挂机v2",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)
    
about:Button("获得管理员权限",function()
loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
end)

about:Button("死亡笔记",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
end)

about:Button("汉化穿墙",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
end)

about:Button("透视",function()  
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
       if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
           v.Character.Humanoid.NameDisplayDistance = 9e9
           v.Character.Humanoid.NameOcclusion = "NoOcclusion"
           v.Character.Humanoid.HealthDisplayDistance = 9e9
           v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
           v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
       end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end)
    
        local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.Name = "Highlight"
        end
    end)
    
    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)
    
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
                task.wait()
            end
    end
    end)
    end)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

about:Toggle("自动互动", "Auto Interact", false, function(state)
        if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25) -- Adjust the wait time as needed
            end
        else
            autoInteract = false
        end
    end)

about:Toggle("无限跳","Toggle",false,function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)

about:Slider("步行速度!", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 400, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

about:Slider("跳跃高度!", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 50, 400, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)

about:Button("甩人",function()
loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
end)
about:Slider('设置重力', 'Sliderflag', 196.2, 196.2, 1000,false, function(Value)
        game.Workspace.Gravity = Value
    end)
    
about:Button("替身",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
end)

about:Button("爬墙",function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

about:Button("iw指令", function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

about:Button("工具挂",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
end)

about:Button("铁拳",function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
end)

about:Toggle("ESP 显示名字", "AMG", ENABLED, function(enabled)
    if enabled then ENABLED = true for _, player in ipairs(Players:GetPlayers()) do onPlayerAdded(player) end Players.PlayerAdded:Connect(onPlayerAdded) Players.PlayerRemoving:Connect(onPlayerRemoving) local localPlayer = Players.LocalPlayer if localPlayer and localPlayer.Character then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end RunService.Heartbeat:Connect(function() if ENABLED then for _, player in ipairs(Players:GetPlayers()) do if player.Character then createNameLabel(player) end end end end) else ENABLED = false for _, player in ipairs(Players:GetPlayers()) do onPlayerRemoving(player) end RunService:UnbindFromRenderStep("move") end
end)

about:Toggle("Circle ESP", "ESP", false, function(state)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.Adornee = player.Character

                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = player.Character
                    billboard.Adornee = player.Character
                    billboard.Size = UDim2.new(0, 100, 0, 100)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true

                    local circle = Instance.new("ImageLabel")
                    circle.Parent = billboard
                    circle.Size = UDim2.new(0, 50, 0, 50)
                    circle.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center the circle
                    circle.AnchorPoint = Vector2.new(0.5, 0.5) -- Set the anchor point to the center
                    circle.BackgroundTransparency = 1
                    circle.Image = "rbxassetid://2200552246" -- Replace with your circle image asset ID
                else
                    if player.Character:FindFirstChildOfClass("Highlight") then
                        player.Character:FindFirstChildOfClass("Highlight"):Destroy()
                    end
                    if player.Character:FindFirstChildOfClass("BillboardGui") then
                        player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end)

about:Button("透视1",function()
loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
end)

about:Button("透视2",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

about:Button("无敌『不适用』",function()
loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
end)

about:Button("隐身（E）",function()
loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
end)

about:Button("电脑键盘",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

about:Button("改fps",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()
end)

about:Button("fps显示",function()
loadstring(game:HttpGet("https://pastefy.app/d9j82YJr/raw",true))()
end)

about:Button("解帧",function()
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-FpsBoost-9260"))()
end)

about:Button("飞车",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/-V2.0/refs/heads/main/%E5%86%B7%E9%A3%9E%E8%BD%A6%E6%BA%90%E7%A0%81.txt"))()
end)

about:Button("飞行v1",function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\90\66\122\99\84\109\49\102\34\41\41\40\41\10")()
end)

about:Button("冷飞行",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/-V3.0/refs/heads/main/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8)%20(1).txt"))()
end)

about:Button("踏空行走",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)

about:Button("紫莎",function()
game.Players.LocalPlayer.Character.Humanoid.Health=0
end)

about:Button("飞檐走壁",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

about:Button("夜视仪",function()
    _G.OnShop = trueloadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
end)

about:Button("反挂机",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)

about:Button("无限跳",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

about:Button("转圈",function()
loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
end)

about:Button("操人脚本",function()
loadstring(game:HttpGet("https://pastebin.com/raw/bzmhRgKL"))();
end)

about:Button("操b脚本", function()
  local SimpleSexGUI = Instance.new("ScreenGui") local FGUI = Instance.new("Frame") local btnNaked = Instance.new("TextButton") local btnSex = Instance.new("TextButton") local tbxVictim = Instance.new("TextBox") local lblFUCKEMALL = Instance.new("TextLabel") local ImageLabel = Instance.new("ImageLabel") local lbltitle = Instance.new("TextLabel") local TextLabel = Instance.new("TextLabel") SimpleSexGUI.Name = "SimpleSexGUI" SimpleSexGUI.Parent = game.CoreGui FGUI.Name = "FGUI" FGUI.Parent = SimpleSexGUI FGUI.BackgroundColor3 = Color3.new(255,255,255) FGUI.BorderSizePixel = 1 FGUI.Position = UDim2.new(0,0, 0.667, 0) FGUI.Size = UDim2.new(0,317, 0,271) FGUI.Draggable = true lbltitle.Name = "Title" lbltitle.Parent = FGUI lbltitle.BackgroundColor3 = Color3.new(255,255,255) lbltitle.BorderSizePixel = 1 lbltitle.Position = UDim2.new (0, 0,-0.122, 0) lbltitle.Size = UDim2.new (0, 317,0, 33) lbltitle.Visible = true lbltitle.Active = true lbltitle.Draggable = false lbltitle.Selectable = true lbltitle.Font = Enum.Font.SourceSansBold lbltitle.Text = "一个简单的操蛋脚本!!" lbltitle.TextColor3 = Color3.new(0, 0, 0) lbltitle.TextSize = 20 btnSex.Name = "Sex" btnSex.Parent = FGUI btnSex.BackgroundColor3 = Color3.new(255,255,255) btnSex.BorderSizePixel = 1 btnSex.Position = UDim2.new (0.044, 0,0.229, 0) btnSex.Size = UDim2.new (0, 99,0, 31) btnSex.Visible = true btnSex.Active = true btnSex.Draggable = false btnSex.Selectable = true btnSex.Font = Enum.Font.SourceSansBold btnSex.Text = "让我们操蛋吧!!" btnSex.TextColor3 = Color3.new(0, 0, 0) btnSex.TextSize = 20 tbxVictim.Name = "VictimTEXT" tbxVictim.Parent = FGUI tbxVictim.BackgroundColor3 = Color3.new(255,255,255) tbxVictim.BorderSizePixel = 1 tbxVictim.Position = UDim2.new (0.533, 0,0.229, 0) tbxVictim.Size = UDim2.new (0, 133,0, 27) tbxVictim.Visible = true tbxVictim.Active = true tbxVictim.Draggable = false tbxVictim.Selectable = true tbxVictim.Font = Enum.Font.SourceSansBold tbxVictim.Text = "名字" tbxVictim.TextColor3 = Color3.new(0, 0, 0) tbxVictim.TextSize = 20 lblFUCKEMALL.Name = "FUCKEMALL" lblFUCKEMALL.Parent = FGUI lblFUCKEMALL.BackgroundColor3 = Color3.new(255,255,255) lblFUCKEMALL.BorderSizePixel = 1 lblFUCKEMALL.Position = UDim2.new (0.025, 0,0.856, 0) lblFUCKEMALL.Size = UDim2.new (0, 301,0, 27) lblFUCKEMALL.Visible = true lblFUCKEMALL.Font = Enum.Font.SourceSansBold lblFUCKEMALL.Text = "操蛋和操蛋" lblFUCKEMALL.TextColor3 = Color3.new(0, 0, 0) lblFUCKEMALL.TextSize = 20 ImageLabel.Name = "ImageLabel" ImageLabel.Parent = FGUI ImageLabel.Image = "http://www.roblox.com/asset/?id=42837..." ImageLabel.BorderSizePixel = 1 ImageLabel.Position = UDim2.new (0.274, 0,0.358, 0) ImageLabel.Size = UDim2.new (0, 106,0, 121) btnSex.MouseButton1Click:Connect(function() local player = tbxVictim.Text local stupid = Instance.new('Animation') stupid.AnimationId = 'rbxassetid://148840371' hummy = game:GetService("Players").LocalPlayer.Character.Humanoid pcall(function() hummy.Parent.Pants:Destroy() end) pcall(function() hummy.Parent.Shirt:Destroy() end) local notfunny = hummy:LoadAnimation(stupid) notfunny:Play() notfunny:AdjustSpeed(10) while hummy.Parent.Parent ~= nil do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[tbxVictim.Text].Character.HumanoidRootPart.CFrame end end)
end)

about:Button("Dex抓包",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoFenHG/Dex-Explorer/refs/heads/main/Dex-Explorer.lua"))()
end)

local UITab7 = win:Tab("『画质光影』",'87437251671184')

local about = UITab7:section("『画质光影』",true)

about:Button("光影", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("光影滤镜", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("超高画质",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

about:Button("光影V4",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("RTX高仿",function()
loadstring(game:HttpGet('https://pastebin.com/raw/Bkf0BJb3'))()
end)

about:Button("光影深", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("光影浅", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

local UITab8 = win:Tab("『无限Robux』",'87437251671184')

local about = UITab8:section("『无限Robux』",true)

about:Button("20Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("50Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("100Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("200Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("500Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

about:Button("1000Robux",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/Free%20Robux.LUA'))()
end)

local UITab99 = win:Tab("『FE』",'87437251671184')

local about = UITab99:section("『FE』",true)

about:Button("FE C00lgui", function()
loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
end)
about:Button("FE 1x1x1x1", function()
loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
end)
about:Button("FE大长腿", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets'))()
end)
about:Button("FE用头", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BK4Q0DfU"))()
end)
about:Button("复仇者", function()
    loadstring(game:HttpGet(('https://pastefy.ga/iGyVaTvs/raw'),true))()
end)
about:Button("鼠标", function()
    loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()
end)
about:Button("变怪物", function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/jfryBKds"))()
end)
about:Button("香蕉枪", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/BananaGunByNerd.lua"))()
end)
about:Button("超长🐔巴", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()
end)
about:Button("操人", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/AHAJAJAKAK/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A.LUA", true))()
end)
about:Button("FE动画中心", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)
about:Button("FE变玩家", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
end)
about:Button("FE猫娘R63", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end)
about:Button("FE", function()
    loadstring(game:HttpGet('https://pastefy.ga/a7RTi4un/raw'))()
end)

local UITab9 = win:Tab("音乐",'87437251671184')

local about = UITab9:section("『音乐』",true)

about:Button("彩虹瀑布",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
    end)
about:Button("防空警报", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end)
about:Button("义勇军进行曲", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end)
about:Button("火车音", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://3900067524"
    sound.Parent = game.Workspace
    sound:Play()
    end)
about:Button("Gentry Road",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://5567523008"
    sound.Parent = game.Workspace
    sound:Play()
    end)
about:Button("植物大战僵尸",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://158260415" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("早安越南",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://8295016126" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
      about:Button("愤怒芒西 Evade?",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://5029269312" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
      about:Button("梅西",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://7354576319" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
      about:Button("永春拳",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1845973140" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("带劲的音乐",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://18841891575" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
      about:Button("韩国国歌",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1837478300" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
      about:Button("哥哥你女朋友不会吃醋吧?",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://8715811379" 
     sound.Parent = game.Workspace 
     sound:Play()  
     end) 
      about:Button("蜘蛛侠出场声音",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://9108472930" 
     sound.Parent = game.Workspace 
     sound:Play()
     end) 
      about:Button("消防车",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://317455930" 
     sound.Parent = game.Workspace 
     sound:Play()
     end) 
      about:Button("万圣节1🎃",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1837467198" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("好听的",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1844125168" 
     sound.Parent = game.Workspace 
     sound:Play()
     end) 
 about:Button("国外音乐脚本",function()          
 loadstring(game:HttpGet(('https://pastebin.com/raw/g97RafnE'),true))()                   
end) 
   about:Button("国歌[Krx版]",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1845918434" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("妈妈生的",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6689498326" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("Music Ball-CTT",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://9045415830" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("电音",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6911766512" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("梗合集",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://8161248815" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("Its been so long",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6913550990" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("Baller",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://13530439660" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end)
   about:Button("男娘必听",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6797864253" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("螃蟹之舞",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://54100886218" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("布鲁克林惨案",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6783714255" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
   about:Button("航空模拟器音乐",function() 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1838080629" 
     sound.Parent = game.Workspace 
     sound:Play() 
     end) 
     
local UITab11 = win:Tab("『其他作者』",'87437251671184')

local about = UITab11:section("『其他作者』",true)

about:Button("LS",function()
KingandJM = "King Advanced and Roaming prohibition center"LS = "LSTMArchive"Free = "My.Conscience"loadstring(game:HttpGet("https://github.com/XiaoyeQWQ/Bs/raw/refs/heads/main/LS.by.Moxiaobai.JM%20Studio.KingAdvancedteam.Members.loveme.LSTAB"))()
end)

about:Button("皮脚本",function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end)

about:Button("禁漫中心",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/anlushanjinchangantangwanle/main/jmjmjmjmjmjmjmjmjmjmjmjmjmjmjmjm.lua"))()
end)

about:Button("XK",function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\88\75\46\84\88\84\34\41\41\40\41\10")()
end)

about:Button("初脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/nianchuchuchuchuchu/refs/heads/main/Protected_2427816874224132.txt"))()
end)

about:Button("鹤脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/qazpin66/-/refs/heads/main/%E9%B9%A41.5.lua"))()
end)

about:Button("鱼龙脚本(破解)",function()
getgenv().FH = "鱼龙脚本"loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,102,50,48,105,51,48,115,52,48,104,47,70,72,47,109,97,105,110,47,70,72,46,108,117,97)))()
end)

about:Button("丁丁脚本(破解)",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/xiu/main/%E4%B8%81%E4%B8%81%E8%84%9A%E6%9C%AC%E6%BA%90%E7%A0%81.txt"))()
end)

about:Button("云脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/VIP/main/%E4%BA%91%E8%84%9A%E6%9C%AC/UNIVERSAL%20VERSION.LUA", true))()
end)

about:Button("king",function()
KingScript = "By King" Roblox= "新飞月二飞春"
KingTeam= "KingQQ新主群https://qm.qq.com/q/SU0hmhIvwk"
loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ShenJiaoBen/main/King-------------Script.txt"))()
end)

about:Button("情云",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\83\99\114\105\112\116"))()
end)

about:Button("剑客",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/JianKeCX/JianKeV5/refs/heads/main/QQqun155160100"))()
end)

about:Button("神青",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/SHEN-QINNG-SCRIPT.lua"))()
end)

about:Button("落叶中心",function()
getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
end)

about:Button("北脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/fjhkl/qw/refs/heads/main/%E5%8C%97%E8%84%9A%E6%9C%AC.txt"))()
end)

about:Button("名脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/wumingjiaoben/z/refs/heads/main/%E6%97%A0%E5%90%8D%E8%84%9A%E6%9C%AC%E6%BA%90%E7%A0%813.0%20(1).lua"))()
end)
 
about:Button("斌脚本2.0.1",function() loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\66\73\78\46\108\117\97\34\41\41\40\41\10")
end)
  
about:Button("复制斌脚本卡密",function()
     setclipboard("bin2024HADE")
end)
         
local UITab10 = win:Tab("『整合』",'87437251671184')

local about = UITab10:section("『整合』",true)

about:Button("微山Doors(2.3.2)",function()    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()
end)

about:Button("BlackKingq",function()
      loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
end)             
      
about:Button("MS DOORS",function()
      loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"),true))()
end)
local UITab11 = win:Tab("『好用的』",'87437251671184')

local about = UITab11:section("『好用的』",true)
      
about:Button("可以清除东西的枪",function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Laser%20Gun"))()
end)
      
             
about:Button("十字架",function()
      loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))();
end)  
      
about:Button("夜视仪",function()
      loadstring(game:HttpGet("https://pastebin.com/raw/4Vsv1Xwn"))()
end)  
      
about:Button("神圣炸弹",function()
      loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)  
      
about:Button("吸铁石",function()
      loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)    
      
about:Button("剪刀",function()
      loadstring(game:HttpGet("https://pastebin.com/raw/v2yEJYmu"))()
end)  
      

about:Button("开启不可能模式",function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt'))() 
end)

about:Button("每15秒一只screech",function()
        local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

        while true do -- Will run the script forever
          coroutine.wrap(function() require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data) end)() -- Coroutines prevent the script from yielding.
        task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
        end
end)

about:Button("每15秒一只halt",function()
        local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

        while true do -- Will run the script forever
          coroutine.wrap(function() require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])          end)() -- Coroutines prevent the script from yielding.
        task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
        end
end)

about:Button("每15秒一只glitch",function()
        local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

        while true do -- Will run the script forever
          coroutine.wrap(function() require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)]) end)() -- Coroutines prevent the script from yielding.
        task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
        end
end)

about:Button("每15秒一次心跳小游戏",function()
        local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

        while true do -- Will run the script forever
          coroutine.wrap(function() firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)  end)() -- Coroutines prevent the script from yielding.
        task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
        end
end)

about:Toggle("刷新时通知", "TZ", false, function(TZ)
     _G.IE = (TZ and true or false) LatestRoom.Changed:Connect(function() if _G.IE == true then local n = ChaseStart.Value - LatestRoom.Value if 0 < n and n < 4 then Notification:Notify("请注意", "事件可能刷新于" .. tostring(n) .. " 房间","rbxassetid://17360377302",3) end end end) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.IE == true then Notify("请注意", "Rush 已刷新","rbxassetid://17360377302",3) elseif inst.Name == "AmbushMoving" and _G.IE == true then Notify("请注意", "Ambush 已刷新","rbxassetid://17360377302",3) end end)
end)
about:Toggle("自动躲避Rush/Ambush", "ADB", false, function(ADB)
    _G.Avoid = (ADB and true or false) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.Avoid == true then Notify("请注意!", "正在躲避 Rush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) elseif inst.Name == "AmbushMoving" and _G.Avoid == true then Notify("注意!", "正在躲避 Ambush.","rbxassetid://17360377302",3) local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position local con = game:GetService("RunService").Heartbeat:Connect(function() game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) end) inst.Destroying:Wait() con:Disconnect() game.Players.LocalPlayer.Character:MoveTo(OldPos) end end)
end)
about:Toggle("无 Screech", "NCH", false, function(NCH)
    _G.NS = (NCH and true or false) workspace.CurrentCamera.ChildAdded:Connect(function(child) if child.Name == "Screech" and _G.NS == true then child:Destroy() end end)
end)

about:Button("最强汉化",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

about:Button("最新",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
end)

about:Button("DX",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/replicator-lol/main/dor.lua"))()
end)

about:Button("RP变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)

about:Button("剪刀",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
end)

about:Button("十字架",function()
loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
end)

about:Button("神圣炸弹",function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)

about:Button("吸铁石",function()
loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)

about:Button("刷怪变怪",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
end)

about:Button("DOORS目前认为最好用的",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

about:Button("变身",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)

about:Button("自动过rooms",function()
 loadstring(game:HttpGet('\x68\x74\x74\x70\x73\x3A\x2F\x2F\x68\x2E\x6C\x6B\x6D\x63\x2E\x61\x73\x69\x61\x2F\x73\x63\x72\x69\x70\x74\x2F\x64\x6F\x6F\x72\x73\x72\x6F\x6F\x6D\x2E\x6C\x75\x61'))()
end)

local UITab12 = win:Tab("『生成』",'87437251671184')

local about = UITab12:section("『生成』",true)

about:Button("生成 Chica",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Chica", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Chica.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 3,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"6."}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Depth",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity
        local entity = Creator.createEntity({
            CustomName = "Depth", -- Custom name of your entity
            Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Depth.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 300, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = false,
            KillRange = 50,
            BreakLights = true,
            BackwardsMovement = false,
            FlickerLights = {
                true, -- Enabled/Disabled
                2, -- Time (seconds)
            },
            Cycles = {
                Min = 2,
                Max = 4,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled/Disabled
                {10, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                false, -- Enabled/Disabled
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled/Disabled
                        Color3.fromRGB(255, 255, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled/Disabled
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"作者不知道要写啥"}, -- Custom death message
        })
        
        -----[[ Advanced ]]-----
        entity.Debug.OnEntitySpawned = function(entityTable)
        print("实体已生成:", entityTable.Model)
    end

        entity.Debug.OnEntityDespawned = function(entityTable)
        print("实体已消失:", entityTable.Model)
    end

        entity.Debug.OnEntityStartMoving = function(entityTable)
        print("实体开始移动:", entityTable.Model)
    end

        entity.Debug.OnEntityFinishedRebound = function(entityTable)
        print("实体结束来回:", entityTable.Model)
    end

        entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
        print("实体:", entityTable.Model, "已进入房间:", room)
    end

        entity.Debug.OnLookAtEntity = function(entityTable)
        print("玩家已看向实体:", entityTable.Model)
    end

        entity.Debug.OnDeath = function(entityTable)
        warn("玩家死亡.")
    end
        ------------------------
        
        -- Run the created entity
        Creator.runEntity(entity)
        
        
end)

about:Button("生成 Doge",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Doge", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Doge.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 5,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {4.9, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Eater",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Eater", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Eater.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Elgato",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Elgato", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Elgato.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 230, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Flamingo",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Flamingo", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Flamingo.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        4, -- Time (seconds)
    },
    Cycles = {
        Min = 3,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Foxy",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Foxy", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Foxy.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.9, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

about:Button("生成 Freddy Fazbear",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Freddy Fazbear", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/FreddyFazbear.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        3, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5.5, 20, 1.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Greed",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Greed", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Greed.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

    end
})

about:Button("生成 Greed RF",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Greed RF", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/GreedRF.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Happy Muchi",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Happy Munci", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/HappyMuchi.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Hehehehaw",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Hehehehaw", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Hehehehaw.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You can", "put your", "custom death", "message here."}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Kardin",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Kardin", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Kardin.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You can", "put your", "custom death", "message here."}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 LSPLASH",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "LSPLASH", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/LSPLASH.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成移动的 Eyes",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Moving Eyes", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/MovingEyes.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You can", "put your", "custom death", "message here."}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Obunga",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Obunga", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Obunga.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 400, -- Percentage, 100 = default Rush speed
    DelayTime = 4, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        4, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 3,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {7, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"作者不知道要写啥"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成旧版 Ambush",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Ambush", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/OldAmbush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"6"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 橙子？",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Orange", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Orange.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你干嘛哈哈哟"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Peter Griffin",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Peter Griffin", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/PeterGriffin.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 350, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"666"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 皮卡丘",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Greed RF", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Pikachu.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 350, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"皮卡皮卡丘"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 索尼克",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Sanic", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Sanic.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 450, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 3,
        Max = 6,
        WaitTime = 4,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {7, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"哈哈哈哈"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Saul",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Saul", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Saul.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"人机"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Wise Mystical Tree",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Greed RF", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Wise Mystical Tree.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"我真的想不到写啥了"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 plamen6789",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Greed RF", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/plamen6789.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"好无聊啊"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 噩梦 Ambush",function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


        -- Create entity
        local entityTable = Spawner.createEntity({
            CustomName = "Nightmare Ambush", -- Custom name of your entity
            Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/NightmareAmbush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 300, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = true,
            KillRange = 50,
            BackwardsMovement = false,
            BreakLights = true,
            FlickerLights = {
                true, -- Enabled/Disabled
                3, -- Time (seconds)
            },
            Cycles = {
                Min = 3,
                Max = 4,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled/Disabled
                {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                false, -- Enabled/Disabled
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled/Disabled
                        Color3.fromRGB(255, 255, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled/Disabled
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"你死于噩梦 Ambush"}, -- Custom death message
        })
        
        
        -----[[  Debug -=- Advanced  ]]-----
        entity.Debug.OnEntitySpawned = function(entityTable)
            print("实体已生成:", entityTable.Model)
    end

        entity.Debug.OnEntityDespawned = function(entityTable)
            print("实体已消失:", entityTable.Model)
    end

        entity.Debug.OnEntityStartMoving = function(entityTable)
            print("实体开始移动:", entityTable.Model)
    end

        entity.Debug.OnEntityFinishedRebound = function(entityTable)
            print("实体结束来回:", entityTable.Model)
    end

        entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
            print("实体:", entityTable.Model, "已进入房间:", room)
    end

        entity.Debug.OnLookAtEntity = function(entityTable)
             print("玩家已看向实体:", entityTable.Model)
    end

        entity.Debug.OnDeath = function(entityTable)
            warn("玩家死亡.")
    end
        ------------------------------------
        
        
        -- Run the created entity
        Spawner.runEntity(entityTable)
        
end)

about:Button("生成 噩梦 rush",function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


        -- Create entity
        local entityTable = Spawner.createEntity({
            CustomName = "Nightmare Rush", -- Custom name of your entity
            Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/NightmareRush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 200, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = true,
            KillRange = 50,
            BackwardsMovement = false,
            BreakLights = true,
            FlickerLights = {
                true, -- Enabled/Disabled
                3, -- Time (seconds)
            },
            Cycles = {
                Min = 3,
                Max = 4,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled/Disabled
                {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                false, -- Enabled/Disabled
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled/Disabled
                        Color3.fromRGB(255, 255, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled/Disabled
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"你死于噩梦rush"}, -- Custom death message
        })
        
        
        -----[[  Debug -=- Advanced  ]]-----
        entity.Debug.OnEntitySpawned = function(entityTable)
            print("实体已生成:", entityTable.Model)
        end

        entity.Debug.OnEntityDespawned = function(entityTable)
            print("实体已消失:", entityTable.Model)
        end

        entity.Debug.OnEntityStartMoving = function(entityTable)
            print("实体开始移动:", entityTable.Model)
        end

        entity.Debug.OnEntityFinishedRebound = function(entityTable)
            print("实体结束来回:", entityTable.Model)
        end

        entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
            print("实体:", entityTable.Model, "已进入房间:", room)
        end

        entity.Debug.OnLookAtEntity = function(entityTable)
            print("玩家已看向实体:", entityTable.Model)
        end

        entity.Debug.OnDeath = function(entityTable)
            warn("玩家死亡.")
        end
        ------------------------------------
        
        
        -- Run the created entity
        Spawner.runEntity(entityTable)
        
end)

about:Button("生成 Angry Munci",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Angry Munci", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/AngryMunci.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 400, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        3, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 3, 1}, -- Shake values (don't change if you don't know)
        50, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于Angry Muchi"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)


about:Button("生成 BigGames",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "BigGames", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/BIGGAMES.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        3, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 5,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 1, 2}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Big Games"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Bonnie",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Bonnie", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Bonnie.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于Bonnie"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("S生成pawn Capybara",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Capybara", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Capybara.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 100, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 3,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Capybara"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Chica",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Chica", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Chica.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 3,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于Chica"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Depth",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity
        local entity = Creator.createEntity({
            CustomName = "Depth", -- Custom name of your entity
            Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Depth.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 300, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = true,
            KillRange = 50,
            BreakLights = true,
            BackwardsMovement = false,
            FlickerLights = {
                true, -- Enabled/Disabled
                2, -- Time (seconds)
            },
            Cycles = {
                Min = 2,
                Max = 4,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled/Disabled
                {10, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                false, -- Enabled/Disabled
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled/Disabled
                        Color3.fromRGB(255, 255, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled/Disabled
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"你死于Depth"}, -- Custom death message
        })
        
        -----[[ Advanced ]]-----
        entity.Debug.OnEntitySpawned = function(entityTable)
            print("实体已生成:", entityTable.Model)
        end

        entity.Debug.OnEntityDespawned = function(entityTable)
            print("实体已消失:", entityTable.Model)
        end

        entity.Debug.OnEntityStartMoving = function(entityTable)
            print("实体开始移动:", entityTable.Model)
        end

        entity.Debug.OnEntityFinishedRebound = function(entityTable)
            print("实体结束来回:", entityTable.Model)
        end

        entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
            print("实体:", entityTable.Model, "已进入房间:", room)
        end

        entity.Debug.OnLookAtEntity = function(entityTable)
            print("玩家已看向实体:", entityTable.Model)
        end

        entity.Debug.OnDeath = function(entityTable)
            warn("玩家死亡.")
        end
        ------------------------
        
        -- Run the created entity
        Creator.runEntity(entity)
        
        
end)

about:Button("生成 Doge",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Doge", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Doge.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 5,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {4.9, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于Doge"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Eater",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Eater", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Eater.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Eater"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Elgato",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Elgato", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Elgato.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 230, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Elgato"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Flamingo",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Flamingo", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Flamingo.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        4, -- Time (seconds)
    },
    Cycles = {
        Min = 3,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Flamingo"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Foxy",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Foxy", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Foxy.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.9, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Foxy"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

    end
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Freddy Fazbear",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Freddy Fazbear", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/FreddyFazbear.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        3, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5.5, 20, 1.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Freddy Fazbear"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Greed",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Greed", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Greed.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Greed"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 Wise Mystical Tree",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Greed RF", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Wise Mystical Tree.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 Wise Mystical Tree"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

about:Button("生成 plamen6789",function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "plamen6789", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/plamen6789.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BreakLights = false,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"你死于 plamen6789"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("实体已生成:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("实体已消失:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("实体开始移动:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("实体结束来回:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("实体:", entityTable.Model, "已进入房间:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("玩家已看向实体:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("玩家死亡.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)

end)

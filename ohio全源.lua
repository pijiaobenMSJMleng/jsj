game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "『二改』"; Text ="GB"; Duration = 2; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "『禁漫中心』"; Text ="内脏与黑火药"; Duration = 4; })

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/hun/main/jmlibrary1.lua"))();        
local win = ui:new("JM")
--
local plr = game:GetService("Players").LocalPlayer
local char
local connect
connect = plr.CharacterAdded:Connect(function(c)
char = c
end)
function getMelee()
for i,bool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
  if bool:GetAttribute("Melee") then
   return bool
  end
end

 for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
  if v:GetAttribute("Melee") then
   return v
  end
end

end

function Distance(what)
if not char then
return 11451400000
end
local Position = what.HumanoidRootPart.CFrame.Position
return (Position - char.HumanoidRootPart.CFrame.Position).magnitude
end
function CPlayer()
local distance = 0
local player = nil
for i,v in pairs(game.Players:GetPlayers()) do 
 if v ~= plr then
   if v.Character then
     if v.Character:FindFirstChild("HumanoidRootPart") then
     local humanoid = v.Character:FindFirstChildOfClass("Humanoid") or v.Character:FindFirstChildOfClass("AnimationController")
     for i,an in next, humanoid:GetPlayingAnimationTracks() do
     if tostring(an) == "Use" then
        return v
        end
     end
     if v.Character.Name == "Do12Kr" or v.Character:GetAttribute("BaseSpeed") < 10 or (v.Character.Humanoid.Health < 35 and v.Character.Humanoid.Health > 0) then
     return v
     end
     if v.Character.Humanoid.Health > 0 then
      local dice = (char.HumanoidRootPart.CFrame.Position - v.Character.HumanoidRootPart.CFrame.Position).magnitude
       if dice > distance then
        distance = dice
       player = v
       end
      end
     end
    end
   end
  end
 return player
end
local function zombieup(zombie)
local hum = zombie:FindFirstChildOfClass("Humanoid")
hum.WalkSpeed = 0.001
hum.PlatformStand = true
zombie.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,2000,0)
end
local function zombiereset(zombie)
local hum = zombie:FindFirstChildOfClass("Humanoid")
hum.WalkSpeed = 1
zombie.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,0,0)
end
local function zombieupspin(zombie)
local hum = zombie:FindFirstChildOfClass("Humanoid")
hum.WalkSpeed = 0.00001
hum.PlatformStand = true
zombie.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,2000+math.random(100,200),0)
local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "Spinning"
Spin.Parent = zombie.HumanoidRootPart
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,114514,0)
zombie.HumanoidRootPart.CanCollide = false
end
local function zombiedown(zombie)
local hum = zombie:FindFirstChildOfClass("Humanoid")
hum:MoveTo(Vector3.new(math.random(10,20),0,math.random(10,20)))
hum.WalkSpeed = 0.0001
hum.PlatformStand = true
zombie.HumanoidRootPart.CanCollide = false
zombie.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,-5000,0)
end
local function zombietp2plr(zombie)
local cframe = CPlayer()
for i=1,5 do
--zombie.HumanoidRootPart.CFrame = cframe
zombie.HumanoidRootPart.CFrame = cframe.Character.HumanoidRootPart.CFrame --+ PartE.CFrame.LookVector
   end
end
local function getnotpikeMelee()
for i,bool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
    if bool:GetAttribute("Melee") and bool.Name ~= "Pike" then
        return bool
    end
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v:GetAttribute("Melee") and v.Name ~= "Pike" then
                return v
            end
        end
    return false
end
local function swing()
local item = getnotpikeMelee()
if item and item.Parent ~= char then
item.Parent = char
end
item.RemoteEvent:FireServer("Swing","Side")
end
local function getnotpikeMelee()
for i,bool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
    if bool:GetAttribute("Melee") and bool.Name ~= "Pike" then
        return bool
    end
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v:GetAttribute("Melee") and v.Name ~= "Pike" then
                return v
            end
        end
    return false
end
function Attack(Item,SwitchItem,SwitchBack,Zombie,AttackHead)
local item = Item
if not Item then
item = getMelee()
return
end
if Distance(Zombie) >= 5 then
return
end
local Back = Item.Parent
local Switched = false
local swing = {
    [1] = "Swing",
    [2] = "Side"
}
local AttackPos = Zombie.HumanoidRootPart.CFrame.Position
local Head = {
    [1] = "HitZombie",
    [2] = Zombie,
    [3] = Zombie.Head.CFrame.Position,
    [4] = true
}
if not char:FindFirstChild(Item.Name) and SwitchItem then
Item.Parent = char
Switched = true
end
task.wait()
char.HumanoidRootPart.CFrame = CFrame.lookAt(char.HumanoidRootPart.CFrame.Position, Vector3.new(AttackPos.X,char.HumanoidRootPart.CFrame.Position.Y,AttackPos.Z))
char:WaitForChild(Item.Name).RemoteEvent:FireServer(unpack(swing))
char:WaitForChild(Item.Name).RemoteEvent:FireServer(unpack(Head))
task.wait()
if Switched and SwitchBack then
Item.Parent = Back
end
end
local flags = {
  esphumans = false,
  zombies = false,
  runneresp = false,
  barrelesp = false,
  sapperesp = false,
  igniteresp = false,
  shambleresp = false,
  backpack = false,
  animation = false,
  modzombie = false,
  silentaura = false,
  attackhead = false,
  barrel = false,
  rotation = false,
  modifyzombies = false,
  flinghambler = false,
  flingrunner = false,
  flingsapper = false,
  tpshambler = false,
  tprunner = false,
  tpsapper = false,
  noslow = false,
  slowzombie = false
}
local gui = true
--local char = plr.Character or plr.CharacterAdded:Wait()
--local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
--local humroot = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
local DELFLAGS = {table.unpack(flags)}
local esptable = {zombies={},runner={},barrel={},sapper={},shambler={},players={},Igniter={},friends={}}

local UITab355 = win:Tab("『玩家』",'7734068321')

local about = UITab355:section("『111』",true)

about:Toggle("保持背包","Toggle",false,function(Val)
    flags.backpack = val
    if val then
    local backchange
    local characteradd
         characteradd = plr.CharacterAdded:Connect(function()
         backchange = plr.PlayerGui.BackpackGui:GetPropertyChangedSignal("Enabled"):Connect(function()
         plr.PlayerGui:FindFirstChild("BackpackGui").Enabled = true
         end)
    end)
        if char then
            backchange = plr.PlayerGui.BackpackGui:GetPropertyChangedSignal("Enabled"):Connect(function()
            plr.PlayerGui:FindFirstChild("BackpackGui").Enabled = true
            end)
        end
    repeat task.wait() until not flags.backpack
    if backchange then
    backchange:Disconnect()
    end
    characteradd:Disconnect()
    end
end)

about:Toggle("自动砍刀","Toggle",false,function(Val)
    if val then while true do local args = {
    [1] = "Swing",
    [2] = "Thrust"
}
game:GetService("Players").LocalPlayer.Character.Sabre.RemoteEvent:FireServer(unpack(args))
 wait() end end
end)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)
about:Toggle("透视玩家","Toggle",false,function(Val)
    flags.esphumans = val
    
    if val then
         local function playeresp(v)
           if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("Torso") then
                local torso = v:WaitForChild("Torso")
                local h = esp(v,Color3.fromRGB(255,255,255),torso,v.Name,0.0)
                table.insert(esptable.players,h)
                 end
             end
        local addconnect
        addconnect = workspace.Players.ChildAdded:Connect(function(pl)
        if pl ~= char then
        playeresp(pl)
            end
        end)
        
        for i,v in pairs(workspace.Players:GetChildren()) do
            if v ~= char then
            task.wait()
                playeresp(v) 
            end
        end
        
        repeat task.wait() until not flags.esphumans
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.players) do
            v.delete()
        end 
    end
end)
about:Slider('Fov', 'Sliderflag', 70, 0.1, 250, false, function(v)
game.Workspace.CurrentCamera.FieldOfView = v
end)

about:Textbox("快速跑步（死后重置）建议用2", "tpwalking", "输入", function(king)
local tspeed = king
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
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

about:Toggle("删除动作动画","Toggle",false,function(Val)
    flags.animation = val
    if val then
        while flags.animation do
        task.wait()
        pcall(function()
         if char then
	      local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       	    for i,v in next, Hum:GetPlayingAnimationTracks() do
		          v:Stop()
	            end
	          end
	        end)
        end
    end
end)

about:Toggle("大师兄步行","Toggle",false,function(Val)
    flags.zapperwalk = val
    if val then
    local walk = false
    local idle = false
        while flags.zapperwalk do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
	                hold:Stop()
	                end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 or humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ZapperWalk" then
		            v:Stop()
		            walk = false
                        end
                    end
                    if not idle then
                    local Anim = Instance.new("Animation")
                    Anim.Name = "ZapperIdle"
                    Anim.AnimationId = "rbxassetid://14498563473"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ZapperIdle" then
		            v:Stop()
		            idle = false
                        end
                    end
                    local Anim = Instance.new("Animation")
                    Anim.Name = "ZapperWalk"
                    Anim.AnimationId = "rbxassetid://14498289874"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
                    k:Play()
                    walk = true
                end
            end
        end
        repeat task.wait() until not flags.zapperwalk
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "ZapperWalk" then
		    v:Stop()
	   elseif tostring(v) == "ZapperIdle" then
	        v:Stop()
	        end
	    end
    end
end)

local UITab3555 = win:Tab("『僵尸透视』",'7734068321')

local about = UITab3555:section("『222』",true)

about:Toggle("红眼透视","Toggle",false,function(Val)
    flags.runneresp = val
    if val then
    local function zombie(v)
    if v:isA("Model") and v.Name == "Agent" then
    if v:GetAttribute("Type") == "Fast" then
    local root = v:WaitForChild("HumanoidRootPart")
    task.wait()
    local h = textesp(Color3.fromRGB(255,51,51),root,"红眼",0.0)
    table.insert(esptable.runner,h)
     end
   end
end
    local addconnect
         addconnect = workspace.Zombies.ChildAdded:Connect(function(s)
         zombie(s)
    end)
    for i,v in pairs(workspace.Zombies:GetChildren()) do
    zombie(v)
 end
    repeat task.wait() until not flags.runneresp
    addconnect:Disconnect()
    
    for i,v in pairs(esptable.runner) do
    v.delete()
    end
  end
end)

about:Toggle("自爆透视","Toggle",false,function(Val)
    flags.barrelesp = val
    if val then
    local function zombie(v)
    if v:isA("Model") and v.Name == "Agent" then
    if v:GetAttribute("Type") == "Barrel" then
    local root = v:WaitForChild("HumanoidRootPart")
    task.wait()
    local h = esp(v,Color3.fromRGB(255,128,0),root,"自爆",0.0)
    table.insert(esptable.barrel,h)
     end
   end
end
    local addconnect
         addconnect = workspace.Zombies.ChildAdded:Connect(function(s)
         zombie(s)
    end)
    for i,v in pairs(workspace.Zombies:GetChildren()) do
    zombie(v)
 end
    repeat task.wait() until not flags.barrelesp
    addconnect:Disconnect()
    
    for i,v in pairs(esptable.barrel) do
    v.delete()
    end
  end
end)

about:Toggle("斧头工兵透视","Toggle",false,function(Val)
    flags.sapperesp = val
    if val then
    local function zombie(v)
    if v:isA("Model") and v.Name == "Agent" then
    if v:GetAttribute("Type") == "Sapper" then
    local root = v:WaitForChild("HumanoidRootPart")
    task.wait()
    local h = textesp(Color3.fromRGB(0,204,204),root,"斧头工兵",0.8)
    table.insert(esptable.sapper,h)
     end
   end
end
    local addconnect
         addconnect = workspace.Zombies.ChildAdded:Connect(function(s)
         zombie(s)
    end)
    for i,v in pairs(workspace.Zombies:GetChildren()) do
    zombie(v)
 end
    repeat task.wait() until not flags.sapperesp
    addconnect:Disconnect()
    
    for i,v in pairs(esptable.sapper) do
    v.delete()
    end
  end
end)

about:Toggle("点火器透视","Toggle",false,function(Val)
    flags.Igniteresp = val
    if val then
    local function zombie(v)
    if v:isA("Model") and v.Name == "Agent" then
    if v:GetAttribute("Type") == "Igniter" then
    local root = v:WaitForChild("HumanoidRootPart")
    task.wait()
    local h = textesp(Color3.fromRGB(204,204,0),root,"点火器",0.0)

    table.insert(esptable.Igniter,h)
     end
   end
end
    local addconnect
         addconnect = workspace.Zombies.ChildAdded:Connect(function(s)
         zombie(s)
    end)
    for i,v in pairs(workspace.Zombies:GetChildren()) do
    zombie(v)
 end
    repeat task.wait() until not flags.Igniteresp
    addconnect:Disconnect()
    
    for i,v in pairs(esptable.Igniter) do
    v.delete()
    end
  end
end)

local UITab3553 = win:Tab("『修改僵尸设置』",'7734068321')

local about = UITab3553:section("『333』",true)

about:Button("修改前置[请点击一次]", function()
                          if v:GetAttribute("Type") == "Normal" and flags.flingshambler then
                              if Distance(v) <= 6 and state ~= "Struggle" then
                              task.spawn(function()
                              swing()
                              end)
                                humroot.CanCollide = false
                                  if state == "Slash" or state == "Claw" then
                                  task.spawn(function()
                                  swing()
                                  end)
                                  local player = CPlayer()
                                  if flags.tpnormal then
                                  if player then
                                      for i=1,50 do
                                          humroot.CFrame = player.Character.HumanoidRootPart.CFrame
                                          end
                                      end
                                  end
                                  if not flags.tpnormal or not player then
                                  zombieupspin(v)
                                      end
                                  end
                              end
                          end
                      -- Normal Modify end --
               if v:GetAttribute("Type") == "Fast" and flags.flingrunner then
               if state == "Charge" or state == "FollowPath" then
               local player = CPlayer()
                   if flags.tprunner then
                       if player then
                           for i=1,50 do
                           zombietp2plr(v)
                         end
                       end
                     end
                   if not flags.tprunner or not player then
                   zombiedown(v)
                   end
                 end
               end
              if v:GetAttribute("Type") == "Sapper" and flags.flingsapper then
                 if state == "Swing" then
                 local player = CPlayer()
                 if flags.tpsapper then
                 if player then
                 for i=1,50 do
                     zombietp2plr(v)
                         end
                     end
                 end
                 if not flags.tpsapper or not player then
                 zombieupspin(v)
                 end
               end
             end
               end
                   end
               end
           end
end)

about:Toggle("混乱者遁地","Toggle",false,function(Val)
flags.flingshambler = val
end)

about:Toggle("红眼遁地","Toggle",false,function(Val)
flags.flingrunner = val
end)

about:Toggle("斧头工兵飞天","Toggle",false,function(Val)
flags.flingsapper = val
end)

about:Toggle("传送红眼","Toggle",false,function(Val)
flags.tprunner = val
end)

about:Toggle("传送斧头工兵","Toggle",false,function(Val)
flags.tpsapper = val
end)

about:Toggle("传送混乱者","Toggle",false,function(Value)
flags.tpnormal = val
end)
local UITab36355 = win:Tab("『ⱼₘ』",'7734068321')

local about = UITab36355:section("『444』",true)

about:Button("水桶灭火", function()
if not char then
return
end
local bucket = char:FindFirstChild("Water Bucket")
if not bucket then
 for i,v in pairs(plr.Backpack:GetChildren()) do
  if v.Name == "Water Bucket" then
   bucket = v
   v.Parent = char
  end
 end
end
if bucket then
  bucket.RemoteEvent:FireServer("Throw")
  bucket.Parent = plr.Backpack
 end 
end)

about:Button("大师兄武器挥舞", function()
    if char then
        local tool = getMelee()
        if tool.Name == "Axe" then
        if tool.Parent ~= char then
        tool.Parent = char
        end
        local Handle = Instance.new("Part", tool)
        Handle.Name = "Handle"
        Handle.Size = Vector3.new(0.888, 7, 0.888)
        Handle.CanCollide = false
        Handle.Transparency = 1
        task.spawn(function() 
        task.wait(2.5)
        Handle:Destroy()
        end)
        task.spawn(function()
            repeat
            task.wait()
            pcall(function()
            Handle.CFrame = char.Model.Blade.CFrame
            end)
            until not Handle
        end)
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://14499470197"
        local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
        k:Play()
        Handle.Touched:Connect(function(Hit)
        pcall(function()
        if Hit.Parent ~= char and Hit.Parent ~= Model and Hit.Parent.Name ~= "3D_Clothing" then
               if Hit.Parent.Zombie then
               local Head = {
               [1] = "HitZombie",
               [2] = Hit.Parent,
               [3] = Hit.Parent.Head.CFrame.Position,
               [4] = true
               }
               tool.RemoteEvent:FireServer("Swing","Over")
               tool.RemoteEvent:FireServer(unpack(Head))
                      end
                   end
               end)
           end)
       end
    end
end)

about:Button("扑倒自救需要连续点击", function()
if char then
 local item = getMelee()
 for _,v in pairs(workspace.Zombies:GetChildren()) do
 pcall(function()
  if v:GetAttribute("Type") ~= "Barrel" then
   if v:FindFirstChild("HumanoidRootPart") then
    Attack(item,true,true,v,true)
     end
    end
   end)
  end
 end
end)

about:Toggle("自动扑救","Toggle",false,function(Value)
while Value do
if char then
 local item = getMelee()
 for _,v in pairs(workspace.Zombies:GetChildren()) do
 pcall(function()
  if v:GetAttribute("Type") ~= "Barrel" then
   if v:FindFirstChild("HumanoidRootPart") then
    Attack(item,true,true,v,true)
     end
    end
   end)
  end
 end
 wait(0.6)
 end
end)

local UITab1 = win:Tab("『信息』",'7734068321')

local about = UITab1:section("『x』",true)

about:Label("作者QQ：198436746")
about:Label("QQ主群：1001390385")
about:Label("作者：丁丁")
about:Label("本脚本二改于明月清风")
about:Label("请支持原作者")
about:Label("本脚本纯属娱乐")
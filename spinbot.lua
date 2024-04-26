local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

local function createGroundTarget()
    local groundTarget = Instance.new("Part")
    groundTarget.Name = player.Name .. "_GroundTarget"
    groundTarget.Size = Vector3.new(2, 0.1, 2)
    groundTarget.Color = Color3.new(0, 1, 0)
    groundTarget.Anchored = true
    groundTarget.CanCollide = false
    groundTarget.Transparency = 0.5
    groundTarget.Parent = game.Workspace
    
    while true do
        groundTarget.Position = player.Character.HumanoidRootPart.Position - Vector3.new(0, 3, 0) 
        
        wait(0.001)
    end
end

local function updateCameraToGroundTarget()
    while true do
        local groundTarget = game.Workspace:FindFirstChild(player.Name .. "_GroundTarget")
        if groundTarget then
            camera.CFrame = CFrame.new(camera.CFrame.Position, groundTarget.Position)
        end
        
        wait(0.001)
    end
end

createGroundTarget()
updateCameraToGroundTarget()

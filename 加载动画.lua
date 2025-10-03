local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local CONFIG = {
    LOAD_TIME = 5,
    PRIMARY_COLOR = Color3.fromRGB(100, 180, 255),
    SECONDARY_COLOR = Color3.fromRGB(180, 100, 255),
    GLOW_INTENSITY = 0.85,
    LOGO_IMAGE = "rbxassetid://6954167216",
    LOGO_TEXT = "作者：刘某",
    BORDER_COLOR = Color3.fromRGB(255, 255, 255),
    BORDER_THICKNESS = 2,
    TEXT_BG_COLOR = Color3.fromRGB(30, 30, 50),
    TEXT_BG_TRANSPARENCY = 0.7,
    SHADOW_COLOR = Color3.fromRGB(0, 0, 50),
    SHADOW_TRANSPARENCY = 0.7,
    MAIN_BG_COLOR = Color3.fromRGB(15, 15, 25),
    MAIN_BG_TRANSPARENCY = 0.15,
    MAIN_BORDER_COLOR = Color3.fromRGB(200, 200, 255),
    MAIN_BORDER_THICKNESS = 4,
    GLOW_COLOR = Color3.fromRGB(100, 150, 255),
    PULSE_SPEED = 3,
    PARTICLE_COUNT = 20,
    LOGO_SCALE = 0.8,
    LOGO_PADDING = 0.05,
    BG_PARTICLE_COUNT = 8
}

ContentProvider:PreloadAsync({
    CONFIG.LOGO_IMAGE,
    "rbxassetid://115464709824070"
})

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WhiteBorderLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0.75, 0, 0.65, 0)
mainContainer.Position = UDim2.new(0.125, 0, 0.175, 0)
mainContainer.BackgroundTransparency = 1
mainContainer.ZIndex = 10
mainContainer.Parent = screenGui

local mainBackground = Instance.new("Frame")
mainBackground.Name = "MainBackground"
mainBackground.Size = UDim2.new(1, 0, 1, 0)
mainBackground.BackgroundColor3 = CONFIG.MAIN_BG_COLOR
mainBackground.BackgroundTransparency = 1
mainBackground.ZIndex = 1
mainBackground.Parent = mainContainer

local mainBgCorner = Instance.new("UICorner")
mainBgCorner.CornerRadius = UDim.new(0.05, 0)
mainBgCorner.Parent = mainBackground

local mainBorder = Instance.new("Frame")
mainBorder.Name = "MainBorder"
mainBorder.Size = UDim2.new(1, 0, 1, 0)
mainBorder.BackgroundTransparency = 1
mainBorder.ZIndex = 2
mainBorder.Parent = mainContainer

local mainBorderStroke = Instance.new("UIStroke")
mainBorderStroke.Color = CONFIG.MAIN_BORDER_COLOR
mainBorderStroke.Thickness = 0
mainBorderStroke.Transparency = 0
mainBorderStroke.Parent = mainBorder

local mainBorderCorner = Instance.new("UICorner")
mainBorderCorner.CornerRadius = UDim.new(0.05, 0)
mainBorderCorner.Parent = mainBorder

local mainBorderGlow = Instance.new("UIStroke")
mainBorderGlow.Color = CONFIG.GLOW_COLOR
mainBorderGlow.Thickness = 0
mainBorderGlow.Transparency = 0.5
mainBorderGlow.Parent = mainBorder

local innerGlowEffect = Instance.new("ImageLabel")
innerGlowEffect.Name = "InnerGlowEffect"
innerGlowEffect.Size = UDim2.new(1.05, 0, 1.05, 0)
innerGlowEffect.Position = UDim2.new(0.5, 0, 0.5, 0)
innerGlowEffect.AnchorPoint = Vector2.new(0.5, 0.5)
innerGlowEffect.BackgroundTransparency = 1
innerGlowEffect.Image = "rbxassetid://115464709824070"
innerGlowEffect.ImageColor3 = CONFIG.GLOW_COLOR
innerGlowEffect.ScaleType = Enum.ScaleType.Slice
innerGlowEffect.SliceCenter = Rect.new(100, 100, 100, 100)
innerGlowEffect.ImageTransparency = 1
innerGlowEffect.ZIndex = 0
innerGlowEffect.Parent = mainBorder

local particles = Instance.new("Frame")
particles.Name = "Particles"
particles.Size = UDim2.new(1, 0, 1, 0)
particles.BackgroundTransparency = 1
particles.ZIndex = 3
particles.Parent = mainBorder

local bgParticles = Instance.new("Frame")
bgParticles.Name = "BackgroundParticles"
bgParticles.Size = UDim2.new(1, 0, 1, 0)
bgParticles.BackgroundTransparency = 1
bgParticles.ZIndex = 0
bgParticles.Parent = mainBackground

local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Size = UDim2.new(0.35, 0, 0.9, 0)
leftPanel.Position = UDim2.new(0.05, 0, 0.05, 0)
leftPanel.BackgroundTransparency = 1
leftPanel.ZIndex = 11
leftPanel.Parent = mainContainer

local logoText = Instance.new("TextLabel")
logoText.Name = "LogoText"
logoText.Size = UDim2.new(1, 0, 0.15, 0)
logoText.Position = UDim2.new(0.5, 0, 0, 0)
logoText.AnchorPoint = Vector2.new(0.5, 0)
logoText.BackgroundTransparency = 1
logoText.Text = CONFIG.LOGO_TEXT
logoText.TextColor3 = Color3.fromRGB(80, 0, 0)
logoText.TextSize = 36
logoText.Font = Enum.Font.GothamBlack
logoText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
logoText.TextStrokeTransparency = 0.5
logoText.TextTransparency = 1
logoText.ZIndex = 12
logoText.Parent = leftPanel

local logoContainer = Instance.new("Frame")
logoContainer.Name = "LogoContainer"
logoContainer.Size = UDim2.new(0.9, 0, 0.7, 0)
logoContainer.Position = UDim2.new(0.5, 0, 0.2, 0)
logoContainer.AnchorPoint = Vector2.new(0.5, 0)
logoContainer.BackgroundTransparency = 1
logoContainer.ZIndex = 11
logoContainer.Parent = leftPanel

local logoImage = Instance.new("ImageLabel")
logoImage.Name = "LogoImage"
logoImage.Size = UDim2.new(1, 0, 1, 0)
logoImage.Position = UDim2.new(0.5, 0, 0.5, 0)
logoImage.AnchorPoint = Vector2.new(0.5, 0.5)
logoImage.BackgroundTransparency = 1
logoImage.Image = CONFIG.LOGO_IMAGE
logoImage.ScaleType = Enum.ScaleType.Fit
logoImage.ZIndex = 13
logoImage.Parent = logoContainer

local frameBorder = Instance.new("UIStroke")
frameBorder.Color = CONFIG.BORDER_COLOR
frameBorder.Thickness = CONFIG.BORDER_THICKNESS
frameBorder.Transparency = 1
frameBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
frameBorder.Parent = logoImage

local borderGlow = Instance.new("UIStroke")
borderGlow.Color = CONFIG.PRIMARY_COLOR
borderGlow.Thickness = CONFIG.BORDER_THICKNESS * 1.5
borderGlow.Transparency = 1
borderGlow.Parent = logoImage

local innerGlow = Instance.new("ImageLabel")
innerGlow.Name = "InnerGlow"
innerGlow.Size = UDim2.new(1.1, 0, 1.1, 0)
innerGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
innerGlow.AnchorPoint = Vector2.new(0.5, 0.5)
innerGlow.BackgroundTransparency = 1
innerGlow.Image = "rbxassetid://115464709824070"
innerGlow.ImageColor3 = CONFIG.PRIMARY_COLOR
innerGlow.ScaleType = Enum.ScaleType.Slice
innerGlow.SliceCenter = Rect.new(100, 100, 100, 100)
innerGlow.ImageTransparency = 1
innerGlow.ZIndex = 11
innerGlow.Parent = logoContainer

local rightPanel = Instance.new("Frame")
rightPanel.Name = "RightPanel"
rightPanel.Size = UDim2.new(0.6, 0, 0.9, 0)
rightPanel.Position = UDim2.new(0.4, 0, 0.05, 0)
rightPanel.BackgroundTransparency = 1
rightPanel.ZIndex = 11
rightPanel.Parent = mainContainer

local welcomeText = Instance.new("TextLabel")
welcomeText.Name = "WelcomeText"
welcomeText.Size = UDim2.new(1, 0, 0.2, 0)
welcomeText.Position = UDim2.new(0.5, 0, 0.1, 0)
welcomeText.AnchorPoint = Vector2.new(0.5, 0.1)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "欢迎使用系统"
welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeText.TextSize = 38
welcomeText.Font = Enum.Font.GothamBlack
welcomeText.TextXAlignment = Enum.TextXAlignment.Center
welcomeText.TextTransparency = 1
welcomeText.ZIndex = 12
welcomeText.Parent = rightPanel

local usernameText = Instance.new("TextLabel")
usernameText.Name = "UsernameText"
usernameText.Size = UDim2.new(1, 0, 0.15, 0)
usernameText.Position = UDim2.new(0.5, 0, 0.35, 0)
usernameText.AnchorPoint = Vector2.new(0.5, 0.35)
usernameText.BackgroundTransparency = 1
usernameText.Text = "玩家: " .. player.Name
usernameText.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameText.TextSize = 28
usernameText.Font = Enum.Font.GothamSemibold
usernameText.TextXAlignment = Enum.TextXAlignment.Center
usernameText.TextTransparency = 1
usernameText.ZIndex = 12
usernameText.Parent = rightPanel

local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(1, 0, 0.1, 0)
loadingText.Position = UDim2.new(0.5, 0, 0.55, 0)
loadingText.AnchorPoint = Vector2.new(0.5, 0.55)
loadingText.BackgroundTransparency = 1
loadingText.Text = "正在加载资源..."
loadingText.TextColor3 = Color3.fromRGB(200, 200, 255)
loadingText.TextSize = 24
loadingText.Font = Enum.Font.Gotham
loadingText.TextXAlignment = Enum.TextXAlignment.Center
loadingText.TextTransparency = 1
loadingText.ZIndex = 12
loadingText.Parent = rightPanel

local progressContainer = Instance.new("Frame")
progressContainer.Name = "ProgressContainer"
progressContainer.Size = UDim2.new(1, 0, 0.15, 0)
progressContainer.Position = UDim2.new(0, 0, 0.75, 0)
progressContainer.BackgroundTransparency = 1
progressContainer.ZIndex = 11
progressContainer.Parent = rightPanel

local progressBackground = Instance.new("Frame")
progressBackground.Name = "ProgressBackground"
progressBackground.Size = UDim2.new(0.9, 0, 0.4, 0)
progressBackground.Position = UDim2.new(0.5, 0, 0.3, 0)
progressBackground.AnchorPoint = Vector2.new(0.5, 0.3)
progressBackground.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
progressBackground.BorderSizePixel = 0
progressBackground.ZIndex = 12
progressBackground.Parent = progressContainer

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0.5, 0)
progressCorner.Parent = progressBackground

local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = CONFIG.PRIMARY_COLOR
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 13
progressBar.Parent = progressBackground

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0.5, 0)
barCorner.Parent = progressBar

local gradient = Instance.new("UIGradient")
gradient.Rotation = 90
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, CONFIG.PRIMARY_COLOR),
    ColorSequenceKeypoint.new(1, CONFIG.SECONDARY_COLOR)
})
gradient.Parent = progressBar

local percentText = Instance.new("TextLabel")
percentText.Name = "PercentText"
percentText.Size = UDim2.new(0.9, 0, 0.4, 0)
percentText.Position = UDim2.new(0.5, 0, 0.7, 0)
percentText.AnchorPoint = Vector2.new(0.5, 0.7)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.TextSize = 22
percentText.Font = Enum.Font.GothamSemibold
percentText.TextXAlignment = Enum.TextXAlignment.Center
percentText.TextTransparency = 1
percentText.ZIndex = 12
percentText.Parent = progressContainer

local function createParticles()
    for i = 1, CONFIG.PARTICLE_COUNT do
        local particle = Instance.new("Frame")
        particle.Name = "Particle_"..i
        particle.Size = UDim2.new(0.01, 0, 0.01, 0)
        particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        particle.BackgroundColor3 = CONFIG.PRIMARY_COLOR
        particle.BackgroundTransparency = 0.7
        particle.ZIndex = 13
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.5, 0)
        corner.Parent = particle
        
        particle.Parent = particles
    end
end

local function createBackgroundParticles()
    for i = 1, CONFIG.BG_PARTICLE_COUNT do
        local particle = Instance.new("Frame")
        particle.Name = "BgParticle_"..i
        particle.Size = UDim2.new(0.02, 0, 0.02, 0)
        particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        particle.BackgroundColor3 = CONFIG.SECONDARY_COLOR
        particle.BackgroundTransparency = 0.9
        particle.ZIndex = 0
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.5, 0)
        corner.Parent = particle
        
        particle.Parent = bgParticles
        
        coroutine.wrap(function()
            local speed = 0.0002 + math.random() * 0.0001
            while particle and particle.Parent do
                particle.Position = particle.Position + UDim2.new(speed, 0, speed, 0)
                if particle.Position.X.Scale > 1.2 then
                    particle.Position = UDim2.new(-0.2, 0, math.random(), 0)
                end
                task.wait(0.1)
            end
        end)()
    end
end

local function logoFloatAnimation()
    local startPos = logoContainer.Position
    local lastUpdate = tick()
    
    while logoContainer and logoContainer.Parent do
        local now = tick()
        if now - lastUpdate >= 0.016 then
            local time = now
            local offset = UDim2.new(0, 0, 0, math.sin(time * 2) * 5)
            logoContainer.Position = startPos + offset
            
            local pulse = 0.7 + math.sin(time * 3) * 0.15
            innerGlow.ImageTransparency = 1 - (pulse * CONFIG.GLOW_INTENSITY)
            borderGlow.Transparency = 0.7 - (pulse * 0.2)
            
            lastUpdate = now
        end
        task.wait()
    end
end

local function logoPulseAnimation()
    local lastUpdate = tick()
    while logoImage and logoImage.Parent do
        local now = tick()
        if now - lastUpdate >= 0.05 then
            local time = now
            local scale = 1 + math.sin(time * 0.5) * 0.03
            logoImage.Size = UDim2.new(1 * scale, 0, 1 * scale, 0)
            lastUpdate = now
        end
        task.wait()
    end
end

local function borderPulseAnimation()
    local lastUpdate = tick()
    while mainBorder and mainBorder.Parent do
        local now = tick()
        if now - lastUpdate >= 0.016 then
            local time = now
            local pulse = 0.5 + math.sin(time * CONFIG.PULSE_SPEED) * 0.15
            
            mainBorderGlow.Thickness = CONFIG.MAIN_BORDER_THICKNESS * (2 + pulse * 0.5)
            mainBorderGlow.Transparency = 0.5 - (pulse * 0.2)
            innerGlowEffect.ImageTransparency = 0.8 - (pulse * 0.1)
            
            for _, particle in ipairs(particles:GetChildren()) do
                if particle:IsA("Frame") then
                    local particleNum = tonumber(string.match(particle.Name, "%d+"))
                    local offsetX = math.sin(time + particleNum) * 0.01
                    local offsetY = math.cos(time + particleNum) * 0.01
                    particle.Position = particle.Position + UDim2.new(offsetX, 0, offsetY, 0)
                    
                    if particle.Position.X.Scale < 0 then
                        particle.Position = UDim2.new(0, 0, particle.Position.Y.Scale, 0)
                    elseif particle.Position.X.Scale > 1 then
                        particle.Position = UDim2.new(1, 0, particle.Position.Y.Scale, 0)
                    end
                    
                    if particle.Position.Y.Scale < 0 then
                        particle.Position = UDim2.new(particle.Position.X.Scale, 0, 0, 0)
                    elseif particle.Position.Y.Scale > 1 then
                        particle.Position = UDim2.new(particle.Position.X.Scale, 0, 1, 0)
                    end
                end
            end
            
            lastUpdate = now
        end
        task.wait()
    end
end

local function elementsEntranceAnimation()
    local tweenInfo = TweenInfo.new(
        1.2, 
        Enum.EasingStyle.Quint, 
        Enum.EasingDirection.Out,
        0,
        false,
        0.2
    )
    
    TweenService:Create(mainBackground, tweenInfo, {BackgroundTransparency = CONFIG.MAIN_BG_TRANSPARENCY}):Play()
    TweenService:Create(mainBorderStroke, tweenInfo, {Thickness = CONFIG.MAIN_BORDER_THICKNESS}):Play()
    TweenService:Create(mainBorderGlow, tweenInfo, {Thickness = CONFIG.MAIN_BORDER_THICKNESS * 2.5}):Play()
    TweenService:Create(innerGlowEffect, tweenInfo, {ImageTransparency = 0.8}):Play()
    
    TweenService:Create(frameBorder, tweenInfo, {Transparency = 0}):Play()
    TweenService:Create(borderGlow, tweenInfo, {Transparency = 0.7}):Play()
    
    task.wait(0.3)
    TweenService:Create(innerGlow, tweenInfo, {ImageTransparency = 0.8}):Play()
    
    task.wait(0.2)
    local textTweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    TweenService:Create(logoText, textTweenInfo, {TextTransparency = 0}):Play()
    task.wait(0.15)
    TweenService:Create(welcomeText, textTweenInfo, {TextTransparency = 0}):Play()
    task.wait(0.15)
    TweenService:Create(usernameText, textTweenInfo, {TextTransparency = 0}):Play()
    task.wait(0.1)
    TweenService:Create(loadingText, textTweenInfo, {TextTransparency = 0}):Play()
    TweenService:Create(percentText, textTweenInfo, {TextTransparency = 0}):Play()
end

local function rainbowTextAnimation()
    local hue = 0
    while usernameText and usernameText.Parent do
        hue = (hue + 0.008) % 1
        usernameText.TextColor3 = Color3.fromHSV(hue, 0.7, 1)
        task.wait(0.08)
    end
end

local function loadingAnimation()
    local startTime = tick()
    local duration = CONFIG.LOAD_TIME
    
    createParticles()
    createBackgroundParticles()
    
    local preloadTime = duration * 0.1
    while tick() - startTime < preloadTime do
        local progress = (tick() - startTime) / preloadTime * 0.1
        progressBar.Size = UDim2.new(progress, 0, 1, 0)
        percentText.Text = string.format("%d%%", math.floor(progress * 100))
        task.wait()
    end
    
    local mainLoadTime = duration * 0.8
    local mainStartTime = tick()
    while tick() - mainStartTime < mainLoadTime do
        local progress = 0.1 + (tick() - mainStartTime) / mainLoadTime * 0.8
        progressBar.Size = UDim2.new(progress, 0, 1, 0)
        percentText.Text = string.format("%d%%", math.floor(progress * 100))
        
        local dots = string.rep(".", math.floor(tick() % 4))
        loadingText.Text = "正在加载资源" .. dots
        
        local hue = 0.5 + progress * 0.3
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHSV(hue, 0.8, 1)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV(hue + 0.1, 0.8, 1))
        })
        
        task.wait()
    end
    
    local finishTime = duration * 0.1
    local finishStartTime = tick()
    while tick() - finishStartTime < finishTime do
        local progress = 0.9 + (tick() - finishStartTime) / finishTime * 0.1
        progressBar.Size = UDim2.new(progress, 0, 1, 0)
        percentText.Text = string.format("%d%%", math.floor(progress * 100))
        task.wait()
    end
    
    loadingText.Text = "加载完成!"
    percentText.Text = "100%"
    
    for i = 1, 2 do
        TweenService:Create(progressBar, TweenInfo.new(0.15), {Size = UDim2.new(1.02, 0, 1.1, 0)}):Play()
        task.wait(0.15)
        TweenService:Create(progressBar, TweenInfo.new(0.15), {Size = UDim2.new(1, 0, 1, 0)}):Play()
        task.wait(0.15)
    end
    
    local flash = Instance.new("Frame")
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    flash.BackgroundTransparency = 1
    flash.ZIndex = 20
    flash.Parent = mainContainer
    
    TweenService:Create(flash, TweenInfo.new(0.3), {BackgroundTransparency = 0.6}):Play()
    task.wait(0.3)
    TweenService:Create(flash, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    
    local fadeOutInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    
    for _, text in ipairs({logoText, welcomeText, usernameText, loadingText, percentText}) do
        TweenService:Create(text, fadeOutInfo, {TextTransparency = 1}):Play()
    end
    
    TweenService:Create(frameBorder, fadeOutInfo, {Transparency = 1}):Play()
    TweenService:Create(borderGlow, fadeOutInfo, {Transparency = 1}):Play()
    TweenService:Create(innerGlow, fadeOutInfo, {ImageTransparency = 1}):Play()
    
    TweenService:Create(mainBackground, fadeOutInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(mainBorderStroke, fadeOutInfo, {Thickness = 0}):Play()
    TweenService:Create(mainBorderGlow, fadeOutInfo, {Thickness = 0}):Play()
    TweenService:Create(innerGlowEffect, fadeOutInfo, {ImageTransparency = 1}):Play()
    
    for _, particle in ipairs(particles:GetChildren()) do
        if particle:IsA("Frame") then
            TweenService:Create(particle, fadeOutInfo, {BackgroundTransparency = 1}):Play()
        end
    end
    
    task.wait(0.8)
    screenGui:Destroy()
end

screenGui.Parent = playerGui

coroutine.wrap(logoFloatAnimation)()
coroutine.wrap(logoPulseAnimation)()
coroutine.wrap(borderPulseAnimation)()
coroutine.wrap(elementsEntranceAnimation)()
coroutine.wrap(rainbowTextAnimation)()
coroutine.wrap(loadingAnimation)()

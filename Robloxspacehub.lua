-- Robloxspace Hub 🚀
-- Interface personalizada para Roblox Studio

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Cores
local Colors = {
    Background = Color3.fromRGB(5, 10, 32),
    Panel = Color3.fromRGB(10, 22, 55),
    Card = Color3.fromRGB(13, 29, 67),
    Blue = Color3.fromRGB(0, 110, 255),
    Purple = Color3.fromRGB(130, 35, 255),
    White = Color3.fromRGB(245, 248, 255),
    Gray = Color3.fromRGB(155, 175, 220)
}

-- Interface
local Gui = Instance.new("ScreenGui")
Gui.Name = "RobloxspaceHub"
Gui.ResetOnSpawn = false
Gui.Parent = playerGui

-- Janela principal
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0.82, 0, 0.78, 0)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Colors.Background
Main.BorderSizePixel = 0
Main.Parent = Gui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)

local Stroke = Instance.new("UIStroke")
Stroke.Color = Colors.Purple
Stroke.Thickness = 2
Stroke.Parent = Main

-- Limita tamanho em telas pequenas
local SizeLimit = Instance.new("UISizeConstraint")
SizeLimit.MinSize = Vector2.new(340, 300)
SizeLimit.MaxSize = Vector2.new(1000, 700)
SizeLimit.Parent = Main

-- Cabeçalho
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 100)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(0.7, 0, 0, 45)
Logo.Position = UDim2.new(0, 25, 0, 12)
Logo.BackgroundTransparency = 1
Logo.Text = "🚀 Robloxspace Hub"
Logo.TextColor3 = Colors.White
Logo.TextSize = 27
Logo.Font = Enum.Font.GothamBold
Logo.TextXAlignment = Enum.TextXAlignment.Left
Logo.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0.7, 0, 0, 25)
Subtitle.Position = UDim2.new(0, 28, 0, 55)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Scripts • Diversão • Sem limites"
Subtitle.TextColor3 = Colors.Gray
Subtitle.TextSize = 14
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- Botão fechar
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 42, 0, 42)
Close.Position = UDim2.new(1, -55, 0, 20)
Close.BackgroundColor3 = Colors.Card
Close.Text = "✕"
Close.TextColor3 = Colors.White
Close.TextSize = 24
Close.Font = Enum.Font.GothamBold
Close.Parent = Header

Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 12)

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

-- Menu lateral
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 180, 1, -115)
Sidebar.Position = UDim2.new(0, 15, 0, 100)
Sidebar.BackgroundColor3 = Colors.Panel
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 14)

local MenuItems = {
    {"🎮", "Jogos"},
    {"⚙️", "Configurações"},
    {"ℹ️", "Sobre"}
}

for i, item in ipairs(MenuItems) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -16, 0, 52)
    Button.Position = UDim2.new(0, 8, 0, 10 + (i - 1) * 62)
    Button.BackgroundColor3 = i == 1 and Colors.Purple or Colors.Panel
    Button.Text = item[1] .. "   " .. item[2]
    Button.TextColor3 = Colors.White
    Button.TextSize = 15
    Button.Font = Enum.Font.GothamBold
    Button.Parent = Sidebar

    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 10)
end

-- Área de conteúdo
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -225, 1, -115)
Content.Position = UDim2.new(0, 205, 0, 100)
Content.BackgroundTransparency = 1
Content.Parent = Main

-- Título
local SectionTitle = Instance.new("TextLabel")
SectionTitle.Size = UDim2.new(1, 0, 0, 75)
SectionTitle.BackgroundColor3 = Colors.Panel
SectionTitle.Text = "  ⚡  Executar Scripts\n       Escolha um jogo abaixo"
SectionTitle.TextColor3 = Colors.White
SectionTitle.TextSize = 19
SectionTitle.Font = Enum.Font.GothamBold
SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
SectionTitle.Parent = Content

Instance.new("UICorner", SectionTitle).CornerRadius = UDim.new(0, 12)

-- Lista de jogos
local Games = {
    {
        Name = "🥚 Roube um Ovo",
        Description = "Carrega o script",
        Color = Color3.fromRGB(0, 140, 255)
    },
    {
        Name = "🔪 Murder Mystery 2",
        Description = "Carrega o script",
        Color = Color3.fromRGB(255, 30, 110)
    },
    {
        Name = "⚔️ Blox Fruits",
        Description = "Carrega o script",
        Color = Color3.fromRGB(0, 160, 255)
    },
    {
        Name = "🏞️ Vale Huss",
        Description = "Carrega o script",
        Color = Color3.fromRGB(0, 220, 120)
    }
}

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, 0, 1, -85)
Scroll.Position = UDim2.new(0, 0, 0, 85)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = Colors.Purple
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = Content

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 12)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Scroll

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.PaddingBottom = UDim.new(0, 10)
Padding.PaddingRight = UDim.new(0, 5)
Padding.Parent = Scroll

-- Criar cards
for i, game in ipairs(Games) do

    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -5, 0, 95)
    Card.BackgroundColor3 = Colors.Card
    Card.BorderSizePixel = 0
    Card.LayoutOrder = i
    Card.Parent = Scroll

    Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 14)

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Color = game.Color
    CardStroke.Thickness = 1.5
    CardStroke.Transparency = 0.2
    CardStroke.Parent = Card

    -- Barra colorida
    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(0, 4, 1, -20)
    Bar.Position = UDim2.new(0, 0, 0, 10)
    Bar.BackgroundColor3 = game.Color
    Bar.BorderSizePixel = 0
    Bar.Parent = Card

    Instance.new("UICorner", Bar).CornerRadius = UDim.new(0, 5)

    -- Nome
    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(0.58, 0, 0, 35)
    Name.Position = UDim2.new(0, 18, 0, 15)
    Name.BackgroundTransparency = 1
    Name.Text = game.Name
    Name.TextColor3 = Colors.White
    Name.TextSize = 17
    Name.Font = Enum.Font.GothamBold
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.Parent = Card

    -- Descrição
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(0.58, 0, 0, 25)
    Desc.Position = UDim2.new(0, 18, 0, 53)
    Desc.BackgroundTransparency = 1
    Desc.Text = game.Description
    Desc.TextColor3 = Colors.Gray
    Desc.TextSize = 13
    Desc.Font = Enum.Font.Gotham
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Card

    -- Botão
    local Execute = Instance.new("TextButton")
    Execute.Size = UDim2.new(0, 145, 0, 48)
    Execute.Position = UDim2.new(1, -160, 0.5, 0)
    Execute.AnchorPoint = Vector2.new(0, 0.5)
    Execute.BackgroundColor3 = game.Color
    Execute.Text = "▶  Executar"
    Execute.TextColor3 = Colors.White
    Execute.TextSize = 15
    Execute.Font = Enum.Font.GothamBold
    Execute.Parent = Card

    Instance.new("UICorner", Execute).CornerRadius = UDim.new(0, 12)

    -- Efeito ao passar o mouse
    Execute.MouseEnter:Connect(function()
        TweenService:Create(
            Execute,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Colors.Purple}
        ):Play()
    end)

    Execute.MouseLeave:Connect(function()
        TweenService:Create(
            Execute,
            TweenInfo.new(0.15),
            {BackgroundColor3 = game.Color}
        ):Play()
    end)

    -- Ação do botão
    Execute.MouseButton1Click:Connect(function()
        print("Jogo selecionado:", game.Name)
        -- Coloque aqui a função legítima do seu jogo.
    end)
end

-- Rodapé
local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, -20, 0, 25)
Footer.Position = UDim2.new(0, 10, 1, -30)
Footer.BackgroundTransparency = 1
Footer.Text = "🚀 Robloxspace Hub — Jogue • Explore • Conquiste"
Footer.TextColor3 = Colors.Gray
Footer.TextSize = 12
Footer.Font = Enum.Font.Gotham
Footer.Parent = Main

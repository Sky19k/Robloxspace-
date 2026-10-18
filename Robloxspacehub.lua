local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Robloxspace Hub 🚀", "DarkTheme")

local Tab = Window:NewTab("Jogos")
local Section = Tab:NewSection("Executar Scripts")

Section:NewButton("🥚 Roube um Ovo", "Carrega o script", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sky19k/Robloxspace-/main/Roube%20um%20ovo.lua"))()
    end)
end)

Section:NewButton("🔪 Murder Mystery 2", "Carrega o script", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sky19k/Robloxspace-/main/Mm2.lua"))()
    end)
end)

Section:NewButton("⚔️ Blox Fruits", "Carrega o script", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sky19k/Robloxspace-/main/Bloxfruits.lua"))()
    end)
end)

Section:NewButton("🏞️ Vale Huss", "Carrega o script", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sky19k/Robloxspace-/main/Vale%20Huss.lua"))()
    end)
end)

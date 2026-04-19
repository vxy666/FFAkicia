loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.luau"))()

task.wait(5)

print("Kicia Hook injected!!!")

task.spawn(function()
    -- FFA Auto Collect Boosters
    loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-FFA-Auto-Collect-Boosters-139784"))()
    print("FFA Auto Collect injected!!!")
    task.wait(1)

    -- Anti-AFK
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicht-Reden/Ultimate-FFa-HUB-Rivals-/refs/heads/main/Anti%20AFK"))()
    print("Anti AFK injected!!!")
    task.wait(1)

    -- Staff Detector
    shared.StaffDetectorLoading = false
    autoload = false
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Ukrubojvo/Modules/main/StaffDetector.lua"))()
    print("Staff Detector injected!!!")
    task.wait(1)

    -- FPS Boost
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pouloupatisfilipp-rgb/ffa_fpsboost_/main/fpsboost"))()
    print("FPS Boost injected!!!")

    print("==============================")
    print("Injection Complete!!!")
    print("==============================")
end)
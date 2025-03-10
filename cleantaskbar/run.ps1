$Registry = @(
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds"; Name = "ShellFeedsTaskbarViewMode"; Type = "DWord"; Value = 2 },
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search"; Name = "SearchboxTaskbarMode"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People"; Name = "PeopleBand"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"; Name = "HideSCAMeetNow"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"; Name = "NoNewsAndInterests"; Type = "DWord"; Value = 1 }
)
foreach ($Item in $Registry) {
    Write-Host "[+] Optmize $($Item.Name)"
    try {
        if (-not (Test-Path $Item.Path)) {
            New-Item -Path $Item.Path -Force | Out-Null
        }
        Set-ItemProperty -Path $Item.Path -Name $Item.Name -Value $Item.Value -Type $Item.Type
    } catch {
        Write-Host "[x] Failed to apply $($Item.Name): $_"
    }
}


Write-Host "[+] Restart explorer."
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
    Start-Process explorer.exe -Verb RunAs
}
Write-Host "[√] Taskbar cleanup completed!"
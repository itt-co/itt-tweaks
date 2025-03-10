$Registry = @(
    @{ Path = "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager"; Name = "GlobalUserDisabled"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search"; Name = "BackgroundAppGlobalToggle"; Type = "DWord"; Value = 0 }
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
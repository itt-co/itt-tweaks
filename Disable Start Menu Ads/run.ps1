$Registry = @(
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"; Name = "BingSearchEnabled"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"; Name = "Enabled"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"; Name = "SystemPaneSuggestionsEnabled"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"; Name = "SoftLandingEnabled"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Name = "ShowSyncProviderNotifications"; Type = "DWord"; Value = 0 }
)

try {
    foreach ($Item in $Registry) {
        if (-not (Test-Path $Item.Path)) {
            New-Item -Path $Item.Path -Force | Out-Null
        }

        New-ItemProperty -Path $Item.Path -Name $Item.Name -PropertyType $Item.Type -Value $Item.Value -Force | Out-Null
        Write-Host "[INFO] Set $($Item.Name) = $($Item.Value) > $($Item.Path)" -ForegroundColor Cyan
    }
    Start-Sleep -Seconds 5
}
catch {
    Write-Host "[!] $($_.Exception.Message)" -ForegroundColor Red
}

$Registry = @(
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"; Name = "GlobalUserDisabled"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"; Name = "BackgroundAppGlobalToggle"; Type = "DWord"; Value = 0 }
)

foreach ($Item in $Registry) {
    try {
        if (-not (Test-Path -Path $Item.Path)) {
            Write-Host "[INFO] '$($Item.Path)' does not exist. Creating it..." -ForegroundColor Yellow
            New-Item -Path $Item.Path -Force | Out-Null
        }

        Write-Host "[INFO] Optimizing $($Item.Path)\$($Item.Name)" -ForegroundColor Cyan

        Set-ItemProperty -Path $Item.Path -Name $Item.Name -Value $Item.Value -Type $Item.Type -Force -ErrorAction Stop
    } catch {
        Write-Host "[!] Failed to apply $($Item.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}

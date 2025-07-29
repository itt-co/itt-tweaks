if (-not $Value) { $Value = 0 }

$Registry = @(
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\BackgroundAccessApplications"; Name = "GlobalUserDisabled"; Type = "DWord" },
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search"; Name = "BackgroundAppGlobalToggle"; Type = "DWord" }
)

foreach ($Item in $Registry) {
    Write-Host "[Info] Optimizing $($Item.Path)\$($Item.Name)" -ForegroundColor Cyan
    try {
        if (-not (Test-Path -Path $Item.Path)) {
            Write-Host "[!] '$($Item.Path)' does not exist. Creating it..." -ForegroundColor Yellow
            New-Item -Path $Item.Path -Force | Out-Null
        }
        Set-ItemProperty -Path $Item.Path -Name $Item.Name -Value $Value -Type $Item.Type -Force -ErrorAction Stop
    } catch {
        Write-Host "[x] Failed to apply $($Item.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}

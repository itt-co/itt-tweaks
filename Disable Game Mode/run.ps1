if (-not $Value) { $Value = 0 }

$RegistryPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR",
    "HKCU:\SOFTWARE\Microsoft\GameBar"
)

try {
    foreach ($path in $RegistryPaths) {
        if (-not (Test-Path -Path $path)) {
            Write-Host "'$path' does not exist. Creating it..." -ForegroundColor Yellow
            New-Item -Path $path -Force | Out-Null
        }

        Write-Host "[INFO] Optimizing $path (AutoGameModeEnabled = $Value)" -ForegroundColor Cyan
        Set-ItemProperty -Path $path -Name "AutoGameModeEnabled" -Value $Value -Type DWord -Force -ErrorAction Stop
    }
}
catch {
    Write-Host "[Error] $($_.Exception.Message)" -ForegroundColor Red
}

param(
    [string[]]$RegistryPaths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR",
        "HKCU:\SOFTWARE\Microsoft\GameBar"
    )
)

try {
    foreach ($path in $RegistryPaths) {
        if (-not (Test-Path -Path $path)) {
            Write-Host "[Warning] Path '$path' does not exist. Creating it..." -ForegroundColor Yellow
            New-Item -Path $path -Force | Out-Null
        }

        Write-Host "[Info] Optimizing $path" -ForegroundColor Cyan
        Set-ItemProperty -Path $path -Name "AutoGameModeEnabled" -Value 0 -Type DWord -Force -ErrorAction Stop
    }
}
catch {
    Write-Host "[Error] $($_.Exception.Message)" -ForegroundColor Red
}

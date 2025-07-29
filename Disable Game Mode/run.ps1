param(
    [string]$PathHKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR",
    [string]$PathHKCU = "HKCU:\SOFTWARE\Microsoft\GameBar"
)

try {
    Write-Host "[Info] Optimizing $PathHKLM" -ForegroundColor Cyan
    Set-ItemProperty -Path $PathHKLM -Name "AutoGameModeEnabled" -Value 0 -Type DWord -Force -ErrorAction Stop
    Write-Host "[Info] Optimizing $PathHKCU" -ForegroundColor Cyan
    Set-ItemProperty -Path $PathHKCU -Name "AutoGameModeEnabled" -Value 0 -Type DWord -Force -ErrorAction Stop
}
catch {
    Write-Host "[Error] $($_.Exception.Message)" -ForegroundColor Red
}

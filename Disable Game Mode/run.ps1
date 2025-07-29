param(
    [string]$PathHKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR",
    [string]$PathHKCU = "HKCU:\SOFTWARE\Microsoft\GameBar"
)

Write-Host "[Info] Optimizing  $PathHKLM" -ForegroundColor Cyan
Set-ItemProperty -Path $PathHKLM -Name "AutoGameModeEnabled" -Value 0 -Type DWord -Force
Write-Host "[Info] Optimizing  $PathHKCU" -ForegroundColor Cyan
Set-ItemProperty -Path $PathHKCU -Name "AutoGameModeEnabled" -Value 0 -Type DWord -Force

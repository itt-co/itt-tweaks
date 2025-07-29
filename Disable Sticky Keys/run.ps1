# Check for administrator privileges
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrator privileges." -ForegroundColor Red
    Write-Host "Please run WinScript.ps1 as Administrator."
    Pause
    Exit
}

# Disable Sticky Keys
Write-Host "-- Disabling Sticky Keys" -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "58"

# Restart Explorer
Stop-Process -Name explorer -Force
Start-Process explorer.exe

# Exit script
Exit

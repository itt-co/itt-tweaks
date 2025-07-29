Param($path = "HKCU:\Control Panel\Accessibility\StickyKeys",)

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrator privileges." -ForegroundColor Red
    Write-Host "Please run WinScript.ps1 as Administrator."
    Pause
    Exit
}

Write-Host "Optimizing  $path" -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "58"

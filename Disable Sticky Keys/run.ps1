Param (
    [string]$path = "HKCU:\Control Panel\Accessibility\StickyKeys"
)

Write-Host "[INFO] Optimizing  $path" -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "58"
Write-Host "[INFO] Restart required" -ForegroundColor Cyan

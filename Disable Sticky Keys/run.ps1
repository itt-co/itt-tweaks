Param (
    [string]$path = "HKCU:\Control Panel\Accessibility\StickyKeys"
)

Write-Host "[Info] Optimizing  $path" -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "58"

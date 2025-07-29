Param($path = "HKCU:\Control Panel\Accessibility\StickyKeys")
Write-Host "Optimizing  $path" -ForegroundColor red
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "58"

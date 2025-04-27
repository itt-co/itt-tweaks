Write-Host '[i] This may take a few minutes'
Add-Log -Message "[+] CHKDSK scan..."  -level "info"
Chkdsk /scan
Add-Log -Message "[+] System File Checker (SFC)..."   -level "info"
sfc /scannow
Add-Log -Message "[+] DISM RestoreHealth..."    -level "info"
DISM /Online /Cleanup-Image /Restorehealth
Add-Log -Message "[+] SFC again to verify repairs..."    -level "info"
sfc /scannow
Add-Log -Message "[√] System health check completed"     -level "info"


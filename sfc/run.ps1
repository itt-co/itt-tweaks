Write-Host '[i] This may take a few minutes'
#Write-Host '[+] CHKDSK scan...' 
Add-Log -Message '[+] CHKDSK scan...'  -level "info"
Chkdsk /scan
#Write-Host '[+] System File Checker (SFC)...' 
Add-Log -Message '[+] System File Checker (SFC)...'   -level "info"

sfc /scannow
#Write-Host '[+] DISM RestoreHealth...' 

Add-Log -Message '[+] DISM RestoreHealth...'    -level "info"

DISM /Online /Cleanup-Image /Restorehealth
#Write-Host '[+] SFC again to verify repairs...' 
Add-Log -Message '[+] SFC again to verify repairs...'    -level "info"

sfc /scannow
#Write-Host '[√] System health check completed' 

Add-Log -Message '[√] System health check completed'     -level "info"


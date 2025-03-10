Write-Host '[i] This may take a few minutes'

Write-Host '[+] CHKDSK scan...' 
Chkdsk /scan

Write-Host '[+] System File Checker (SFC)...' 
sfc /scannow

Write-Host '[+] DISM RestoreHealth...' 
DISM /Online /Cleanup-Image /Restorehealth

Write-Host '[+] SFC again to verify repairs...' 
sfc /scannow

Write-Host '[+] System health check completed' 
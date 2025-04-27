function Start-Spinner {
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    $spinnerFrames = @('/', '-', '\', '|')
    $frameIndex = 0

    while ($true) {
        $frame = $spinnerFrames[$frameIndex++ % $spinnerFrames.Count]
        Write-Host -NoNewline "`r$frame $Message"
        Start-Sleep -Milliseconds 100
    }

    Write-Host "`r[√] $Message"
}

# --------------------------------------------------
# Main Script Example
# --------------------------------------------------

Write-Host '[i] This may take a few minutes.'

Start-Spinner -Message 'CHKDSK scan.....'
#chkdsk /scan
Start-Sleep -Seconds 2
Write-Host "`r[√] CHKDSK scan completed"

Start-Spinner -Message 'System File Checker (SFC).....'
#sfc /scannow
Start-Sleep -Seconds 2
Write-Host "`r[√] System File Checker (SFC) completed"

Start-Spinner -Message 'DISM RestoreHealth.....'
#DISM /Online /Cleanup-Image /Restorehealth
Start-Sleep -Seconds 2
Write-Host "`r[√] DISM RestoreHealth completed"

Start-Spinner -Message 'SFC again to verify repairs.....'
#sfc /scannow
Start-Sleep -Seconds 2
Write-Host "`r[√] SFC again completed"

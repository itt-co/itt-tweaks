function Start-Spinner {
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    $spinnerFrames = @('/', '-', '\', '|')
    $frameIndex = 0

    $job = Start-Job -ScriptBlock {
        $stopSpinner = $false
        while (-not $stopSpinner) {
            $frame = $spinnerFrames[$frameIndex++ % $spinnerFrames.Count]
            Write-Host -NoNewline "`r$frame $Message"
            Start-Sleep -Milliseconds 100
        }
    }

    # Wait for completion of action, this is where the spinner will stop automatically
    $job | Wait-Job
    Remove-Job $job

    Write-Host "`r[√] $Message"
}

# Main Script
Start-Spinner -Message 'CHKDSK scan.....'
Start-Sleep -Seconds 2
Write-Host "`r[√] CHKDSK scan completed"

Start-Spinner -Message 'System File Checker (SFC).....'
Start-Sleep -Seconds 2  
Write-Host "`r[√] System File Checker (SFC) completed"

Start-Spinner -Message 'DISM RestoreHealth.....'
Start-Sleep -Seconds 2  
Write-Host "`r[√] DISM RestoreHealth completed"

Start-Spinner -Message 'SFC again to verify repairs.....'
Start-Sleep -Seconds 2  
Write-Host "`r[√] SFC again completed"

function Start-Spinner {
    param(
        [Parameter(Mandatory)]
        [string]$Message,

        [Parameter(Mandatory)]
        [ScriptBlock]$Action
    )

    $spinnerFrames = @('/', '-', '\', '|')
    $frameIndex = 0

    #$Action.Invoke()

    while ($true) {
        $frame = $spinnerFrames[$frameIndex++ % $spinnerFrames.Count]
        Write-Host -NoNewline "`r[ $frame ] $Message"
        Start-Sleep -Milliseconds 100
    }

    Write-Host "`r[√] $Message"
}

# --------------------------------------------------
# Main Script
# --------------------------------------------------

Write-Host '[i] This may take a few minutes'

Start-Spinner -Message 'CHKDSK scan.....' -Action {
    chkdsk /scan
}

Start-Spinner -Message 'System File Checker (SFC).....' -Action {
    sfc /scannow
}

Start-Spinner -Message 'DISM RestoreHealth.....' -Action {
    DISM /Online /Cleanup-Image /Restorehealth
}

Start-Spinner -Message 'SFC again to verify repairs.....' -Action {
    sfc /scannow
}

Write-Host '[√] System health check completed'

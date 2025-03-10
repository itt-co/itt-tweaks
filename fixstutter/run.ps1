$files = @(
    "C:\Windows\System32\GameBarPresenceWriter.exe",
    "C:\Windows\System32\GameBarPresenceWriter.proxy.dll",
    "C:\Windows\System32\Windows.Gaming.UI.GameBar.dll"
)

foreach ($file in $files) 
{
    if (Test-Path $file)
    {
        takeown /f $file
        ICACLS $file /grant administrators:F
        timeout /T 2 /NOBREAK > $null
        $newName = "$file[emadadel4].bak"
        Rename-Item $file $newName
    }
    else
    {
        Clear-Host
        Write-Host "Already been fixed"
    }
}
# Create base registry keys
New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open\command" -Force
New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open\DropTarget" -Force
New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\print\command" -Force
New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\print\DropTarget" -Force

# Set MuiVerb value
Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open" -Name "MuiVerb" -Value "@photoviewer.dll,-3043"

# Set open command
$openCommand = '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open\command" -Name "(default)" -Value $openCommand -Type ExpandString

# Set DropTarget CLSID for open
Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open\DropTarget" -Name "Clsid" -Value "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"

# Set print command
$printCommand = '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\print\command" -Name "(default)" -Value $printCommand -Type ExpandString

# Set DropTarget CLSID for print
Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\print\DropTarget" -Name "Clsid" -Value "{60fd46de-f830-4894-a628-6fa81bc0190d}"

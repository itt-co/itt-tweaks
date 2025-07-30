# Create the main keys
New-Item -Path "HKCR:\Applications\photoviewer.dll" -Force
New-Item -Path "HKCR:\Applications\photoviewer.dll\shell" -Force

# Open command settings
New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open" -Force
New-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open" -Name "MuiVerb" -Value "@photoviewer.dll,-3043" -PropertyType String -Force

New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open\command" -Force
Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open\command" -Name "(Default)" -Value '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1' -Force

New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open\DropTarget" -Force
New-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open\DropTarget" -Name "Clsid" -Value "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" -PropertyType String -Force

# Print command settings
New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\print" -Force

New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\print\command" -Force
Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\print\command" -Name "(Default)" -Value '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1' -Force

New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\print\DropTarget" -Force
New-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\print\DropTarget" -Name "Clsid" -Value "{60fd46de-f830-4894-a628-6fa81bc0190d}" -PropertyType String -Force

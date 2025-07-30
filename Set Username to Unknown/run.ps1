$currentUsername = $env:USERNAME
Rename-Computer -NewName 'Unknown'
Rename-LocalUser -Name $currentUsername -NewName 'Unknown'

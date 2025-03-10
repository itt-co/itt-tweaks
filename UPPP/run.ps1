

Write-Host "[+] Enabling the Ultimate Performance Power Plan..."
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; Start-Process powercfg.cpl
Write-Host "[i] Go to the power options to activate it"
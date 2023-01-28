If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -force -ea SilentlyContinue }
If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -force -ea SilentlyContinue } 

New-GPO -Name "Blokada Panelu Sterowania" -Comment "Wyłączony panel sterowania" | New-GPLink -Target "OU=Pracownicy,DC=test,DC=local"

Set-GPRegistryValue -Name "Blokada Panelu Sterowania" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoControlPanel" -Value 1 -Type DWord
Set-GPRegistryValue -Name "Blokada Panelu Sterowania" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName 'NoDispCPL' -Value 1 -Type DWord

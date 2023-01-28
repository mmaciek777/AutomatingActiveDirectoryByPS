$Surname = Read-Host -Prompt "Podaj login użytkownika"

Get-ADUser -Identity $Surname -Properties "LastLogonDate" | Format-List Name,GivenName,Surname,LastLogonDate,SID,DistinguishedName
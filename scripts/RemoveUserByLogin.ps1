$login = Read-Host -Prompt "Podaj login uzytkownika do skasowania"

Remove-ADUser -Identity $login 